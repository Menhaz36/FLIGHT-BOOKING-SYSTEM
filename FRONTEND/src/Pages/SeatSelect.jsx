import React from 'react'
import { useParams } from 'react-router-dom';
import { useEffect } from 'react';
import axios from 'axios';
import { useState } from 'react';
import Flight_id from '../components/bookSeat/Flight_id';

const SeatSelect = () => {

    const { id } = useParams();
    console.log("flight id yeh hn", id);
    const [flight, setFlight] = useState(null);
    const [bookedSeats, setbookedSeats] = useState([]);


    

    useEffect(() => {

        // fetchFlight();
        axios.get(`/api/flight/${id}`)
            .then(response => {
                console.log(response.data); // Success response
                setFlight(response.data);
                console.log("booked seat:", flight);
            })
            .catch(error => {
                console.error(error); // Error handling
            });

    }, []);

    // Watch flight state
    useEffect(() => {
        if (flight) {
            console.log("booked seat after state update:", flight);
            setbookedSeats(flight.map(obj => obj.SeatNumber));
        }
    }, [flight]);

    // useEffect(() => {
    //   if (bookedSeats) {
    //     console.log("booked seat", bookedSeats);
    //   }
    // }, [bookedSeats]);

    if (!flight) return <p className='text-lg font-stretch-50%'>No seat available</p>;
    //extracting booked seat from response
    // setbookedSeats(flight.)

    return (
        <div>
        <Flight_id bookedSeats={bookedSeats}/>
        </div>
        
    )
}

export default SeatSelect