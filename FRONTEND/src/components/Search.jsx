import React from 'react';



const Search = () => {


    return (
        <form className='shadow-2xl/35 mt-40 bg-white border-2 border-cyan-800 text-gray-500 rounded-lg px-20 py-15  flex flex-col md:flex-row max-md:items-start gap-6 max-w-5xl mx-auto'>
            
            <div className="flex flex-wrap gap-6 md:gap-10 max-md:gap-4 justify-center w-full">
            
                {/*from*/}
                <div>
                    <div className='flex flex-col w-full sm:w-[45%] md:w-[30%]'>
                        <label htmlFor="from">From</label>
                    </div>
                    <input id="from" type="text" placeholder="Source" className="w-full rounded border border-gray-300 px-4 py-3 mt-1 text-base outline-none focus: border-b-cyan-700" required />
                </div>

                {/*to*/}
                <div>
                    <div className='flex flex-col w-full sm:w-[45%] md:w-[30%]'>
                        <label htmlFor="to">To</label>
                    </div>
                    <input id="to" type="text" placeholder="Destination" className="w-full rounded border border-gray-300 px-4 py-3 mt-1 text-base outline-none focus: border-b-cyan-700" required />
                </div>

                {/*depart*/}
                <div>
                    <div className='flex items-center gap-2'>
                        <svg className="w-4 h-4 text-gray-800" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" viewBox="0 0 24 24" >
                            <path stroke="currentColor" strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M4 10h16M8 14h8m-4-7V4M7 7V4m10 3V4M5 20h14a1 1 0 0 0 1-1V7a1 1 0 0 0-1-1H5a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1Z" />
                        </svg>
                        <label htmlFor="depart" className="block font-medium">Departure</label>
                    </div>
                    <input id="depart" type="date" className=" rounded border border-gray-300 px-4 py-3 mt-1 text-base outline-none focus: border-b-cyan-700" />
                </div>

                {/*passengers*/}
                <div className='flex md:flex-col max-md:gap-2 max-md:items-center'>
                    <label htmlFor="passenger">Passengers</label>
                    <input min={1} id="passenger" type="number" className=" rounded border border-gray-300 px-3 py-2 mt-1.5 text-base outline-none focus: border-b-cyan-700  max-w-16" placeholder="0" />
                </div>
                
                {/*class*/}
                <div className="flex flex-col">
                    <label htmlFor="class">Class</label>
                    <select id="class" className=" rounded border border-gray-300 px-4 py-3 mt-1.5 text-base outline-none focus: border-b-cyan-700">
                        <option value="economy">Economy</option>
                        <option value="business">Business</option>
                        <option value="first">First Class</option>
                    </select>
                </div>


                <button className="mt-7 w-64 flex items-center justify-center gap-2 rounded-md bg-linear-to-r from-black to-gray-600 shadow-2xl/35 py-3 px-6 text-white font-medium my-auto cursor-pointer max-md:w-full max-md:py-2 
             hover:from-gray-500 hover:to-black active:scale-95 transition-all duration-200 shadow-md hover:shadow-lg">
                    <svg className="w-4 h-4 text-white" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" viewBox="0 0 24 24" >
                        <path stroke="currentColor" strokeLinecap="round" strokeWidth="2" d="m21 21-3.5-3.5M17 10a7 7 0 1 1-14 0 7 7 0 0 1 14 0Z" />
                    </svg>
                    <span>Search</span>
                </button>

            </div>
        </form>
    );
}

export default Search;


