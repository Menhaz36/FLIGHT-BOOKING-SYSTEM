import React from 'react'
import Navbar from '../../components/Navbar'
import Footer from '../../components/Footer' 
import { Outlet } from 'react-router-dom'

const AppLayout = () => {
  return (
    <>
      <Navbar />
      
      {/* Wrapper for page content with padding-top to avoid being hidden under fixed navbar */}
      <div className="pt-40 md:pt-24">
        <Outlet />
      </div>

      <Footer />
    </>
  )
}

export default AppLayout
