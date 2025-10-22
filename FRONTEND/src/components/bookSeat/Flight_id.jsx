import React from 'react'
import '../../App.css'
import './FLight_id.css'

import Seat_map from './Seat_map'


function Flight_id({ bookedSeats = [] }) {

  return (
      <div className="plane">
        <div className="cockpit">
          <h1></h1>
        </div>
        <div className="exit exit--front fuselage"></div>
        <div className='fuselage'><Seat_map bookedSeats={bookedSeats} /></div>{/*here i need to add props */}


        <div className="exit exit--front fuselage"></div>
      </div>
  )
}

export default Flight_id;