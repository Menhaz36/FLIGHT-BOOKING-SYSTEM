import express from 'express';
import mysql from 'mysql2/promise';
import cors from 'cors';

const app = express();
const port = 5001;

// Middleware
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: false }));

// MySQL connection
const db = await mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'ruchika', // your MySQL root password
    database: 'FMS' // your database name
});

console.log('✅ Connected to MySQL database');

// Test route
app.get('/', (req, res) => {
    res.send('API is running...');
});

// Function to get seats from the database
const get_seats = async () => {
    try {
        const [rows] = await db.query('SELECT * FROM Seat');
        return rows;
    } catch (err) {
        console.error('Error fetching seats:', err);
        throw err;
    }
};

// Route to get all seats
app.get('/api/seats', async (req, res) => {
    try {
        const seats = await get_seats();
        console.log('Seats fetched:', seats);
        res.json(seats);
    } catch (err) {
        res.status(500).json({ error: 'Database error' });
    }
});


app.post('/api/search_flights', async (req, res) => {
    const { source, destination, date } = req.body;
    console.log('Search parameters:', { source, destination, date });

    try {
        const [flights] = await db.execute('CALL search_flight(?,?,?)', [source, destination, date]);
        console.log('Flights found:', flights);


        res.send(flights); // Send formatted HTML to browser

    } catch (err) {
        console.error('Error searching flights:', err);
        res.status(500).send('<h1>Database error</h1>');
    }
});

app.get('/api/flight/:id', async (req, res) => {
    const flightId = req.params.id;
    try {
        const [rows] = await db.execute('CALL booked_seats(?)', [flightId]);
        if (rows.length === 0) {
            return res.status(404).json({ error: 'Flight not found' });
        }
        console.log('Flight ID requested:', flightId);
        console.log('booked seat  response:', rows[0]);
        res.json(rows[0]);
    } catch (err) {
        console.error('Error fetching flight details:', err);

        res.status(500).json({ error: 'Database error' });
    }
});

/*
booking data structure:Object
flight: {source: 'Delhi', destination: 'Mumbai', date: '2025-10-12', flightName: 'Indigo'}
seats: (2) [{…}, {…}]
selectedFlight: {flightID: 1, source: 'Delhi', destination: 'Mumbai', date: '2025-10-12', flightName: 'Indigo'}
selectedflight: {flightID: 1, source: 'Delhi', destination: 'Mumbai', date: '2025-10-12', flightName: 'Indigo'}
{flightID: 1, source: 'Delhi', destination: 'Mumbai', date: '2025-10-12', flightName: 'Indigo'}
totalPrice: 16000
user: Array(2)
0
{name: 'Menhaz', age: '21', gender: 'male'}
1
: 
{name: 'Ruchika', age: '21', gender: 'female'}
length
: 
2


*/
app.post("/api/bookings", async (req, res) => {
  try {
    const bookingData = req.body;
    const { selectedFlight, seats } = bookingData;

    if (!selectedFlight || !seats || seats.length === 0) {
      return res.status(400).json({ error: "No flight or seats selected" });
    }

    const flightID = selectedFlight.flightID;

    // Start transaction
    await db.beginTransaction();

    try {
      const insertQuery = `
        INSERT INTO seat (FlightID, SeatNumber, Category, Price, Status)
        VALUES (?, ?, ?, ?, ?)
        ON DUPLICATE KEY UPDATE Status = 'Booked'
      `;

      for (const seat of seats) {
        const { label, category, price } = seat;
        await db.query(insertQuery, [flightID, label, category, price, "Booked"]);
      }

      // Commit
      await db.commit();
      res.json({ message: "Seats booked successfully" });
    } catch (err) {
      await db.rollback();
      throw err;
    }
  } catch (error) {
    console.error("Error storing booking data:", error);
    res.status(500).json({ error: "Failed to store booking data" });
  }
});

// Start server
app.listen(port, () => {
    console.log(`🚀 Server running on http://localhost:${port}`);
});

/** * Export the app for testing or further usage
 */
export default app;