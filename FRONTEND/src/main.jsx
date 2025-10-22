import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'
import {BrowserRouter} from "react-router-dom"
import AppLayout from './Pages/layout/AppLayout.jsx';
import { createBrowserRouter, RouterProvider } from 'react-router-dom';
import App from './App.jsx'
import Home from './Pages/Home.jsx';
import Login from './Pages/Login.jsx';
import SeatSelect from './Pages/SeatSelect.jsx';

const router = createBrowserRouter([
  { path: '/', element: <AppLayout />,  
    children: [{
      path: '/', element: <Home />
    },
    {
      path: '/flight/:id', element: <SeatSelect/>
    }
  ]
  },
  { path: '/Login', element: <Login /> },
]);

createRoot(document.getElementById('root')).render(
  <StrictMode>
    <RouterProvider router={router}/>
  </StrictMode>,
)
