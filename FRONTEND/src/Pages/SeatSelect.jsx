import React from 'react'
import { useParams } from 'react-router-dom';
import { useEffect } from 'react';
import axios from 'axios';
import { useState } from 'react';
import Flight_id from '../components/bookSeat/Flight_id';
import { useLocation } from 'react-router-dom';

const SeatSelect = () => {

    const { id } = useParams();
    const location = useLocation();
    const flightFromState = location.state?.flight;

    const [flight, setFlight] = useState(flightFromState || null);
    const [bookedSeats, setBookedSeats] = useState([]);

   useEffect(() => {
    if (!flightFromState && id) {
        // fetch flight by id if state not available
        axios.get(`/api/flight/${id}`)
        .then(res => {
            setFlight(res.data);
            setBookedSeats(res.data.bookedSeats || []);
            })
        .catch(err => console.error(err));
            } else if (flightFromState) {
                setBookedSeats(flightFromState.bookedSeats || []);
            }
        }, [id, flightFromState]);

    // Watch flight state
    // useEffect(() => {
    //     if (flight) {
    //         console.log("booked seat after state update:", flight);
    //         setBookedSeats(flight.bookedSeats || []);
    //     }
    // }, [flight]);

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