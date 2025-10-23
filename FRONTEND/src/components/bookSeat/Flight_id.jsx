import React from 'react'
import '../../App.css'
import './FLight_id.css'
import Seat_map from './Seat_map'
import { useLocation } from 'react-router-dom'


function Flight_id({ bookedSeats = [] }) {

  const location = useLocation();
  console.log('data passed through params      :', location.state);

  return (
    <div className="plane">
      <div className="cockpit">
        <h1></h1>
      </div>
      <div className="exit exit--front fuselage"></div>
      <div className='fuselage'><Seat_map bookedSeats={bookedSeats} MaxSeatSelection={location.state.TotalPassenger} /></div>{/*here i need to add props */}


      <div className="exit exit--front fuselage"></div>
    </div>
  )
}

export default Flight_id;