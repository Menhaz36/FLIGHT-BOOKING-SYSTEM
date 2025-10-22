import './App.css'//ADD THIS IN EVERY FOLDER TO USE TAILWIND 
import React from 'react';
import Navbar from './components/Navbar.jsx';
import {Route, Routes, useLocation} from 'react-router-dom';
import Home from './Pages/Home.jsx'
import Login from './Pages/Login.jsx';
function App() {


  return (
    <div>
      <Navbar />
      <div className='min-h-[70vh]'>
        <Routes>
          <Route path='/' element={<Home/>} />
          <Route path='/login' element={<Login/>} />
        </Routes>
      </div>
    </div>
  )
}

export default App
