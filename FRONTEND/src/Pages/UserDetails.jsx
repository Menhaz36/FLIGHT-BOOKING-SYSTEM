import React, { useContext } from "react";
import { UserContext } from "../context/userContext";
import { useNavigate, useParams } from "react-router-dom";




const UserDetails = () => {
  const { user, setuser, numUser, selectedFlight } = useContext(UserContext);
  const navigate = useNavigate();
  const { id } = useParams();

    const handleChange = (index, field, value) => {
    const updated = [...user];
    if (!updated[index]) updated[index] = { name: "", age: "", gender: "" }; // ensure object exists
    updated[index][field] = value;
    setuser(updated);
    };

    


  return (
    <div className=" p-4 md:p-8 max-w-4xl mx-auto text-black">
      <h1 className="text-2xl font-bold mb-6 text-center">Passenger Details</h1>
        {selectedFlight && (
        <p className="mb-6 text-center">
            Flight: {selectedFlight.FlightName} ({selectedFlight.Source} → {selectedFlight.Destination})
        </p>
        )}
      {Array.from({ length: numUser }).map((_, i) => (
        <div key={i} className="bg-gray-200 p-6 rounded-lg mb-4 shadow-lg">
          <h3 className="text-lg font-semibold mb-3">
            Passenger {i + 1}
          </h3>
           <div className="flex flex-col md:flex-row gap-4">
            <input
                type="text"
                placeholder=" Full Name"
                value={user[i]?.name || ""}
                onChange={(e) => handleChange(i, "name", e.target.value)}
                className="flex-2 w-full h-10 md:w-1/2 border border-black mb-3 p-2 rounded text-black"
            />

            <input
                type="number"
                placeholder=" Age"
                value={user[i]?.age || ""}
                onChange={(e) => handleChange(i, "age", e.target.value)}
                className=" flex-1 w-full h-10 md:w-1/2 border border-black p-2 rounded text-black"
            />

            <select
                value={user[i]?.gender || ""}
                onChange={(e) => handleChange(i, "gender", e.target.value)}
                className="flex-1 w-full h-10 md:w-1/4 border border-black mb-3 p-2 rounded text-black"
                >
                <option value="">Select Gender</option>
                <option value="male">Male</option>
                <option value="female">Female</option>
                <option value="other">Other</option>
            </select>
           </div>
        </div>
      ))}

      <button
        className="px-4 py-2 my-auto cursor-pointer max-md:w-full max-md:py-2 text-white rounded mt-4 bg-linear-to-r from-black to-gray-600 shadow-2xl/35 hover:from-gray-500 hover:to-black active:scale-95 transition-all duration-200 shadow-md hover:shadow-lg"
        onClick={() => {console.log(user); 
            
            navigate(`/flight/${selectedFlight.FlightID}/seatselect`, { state: { flight: selectedFlight } });

        }}
      >
        Proceed to seat selection
      </button>
    </div>
  );
};


export default UserDetails;
