import express from 'express';
import mysql from 'mysql2/promise';
import cors from 'cors';

const app = express();
const port = 5000;

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


// Start server
app.listen(port, () => {
    console.log(`🚀 Server running on http://localhost:${port}`);
});

/** * Export the app for testing or further usage
 */
export default app;