import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'
import App from './App.jsx'
import './style.css'
import {createBrowerRouter, RouterProvider} from "react-router-dom";

const router = createBrowerRouter([
  {
    path: "/",
    element: <App/>,
  }
])
createRoot(document.getElementById('root')).render(
  <StrictMode>
    <RouterProvider router={router }/>
  </StrictMode>,
)
