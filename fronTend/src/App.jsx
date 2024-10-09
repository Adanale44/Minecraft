import { useState } from 'react'
import './App.css'
import { FaGithub } from "react-icons/fa";
import { FaYoutube } from "react-icons/fa";
import { FaInstagramSquare } from "react-icons/fa";


function App() {
  //const [count, setCount] = useState(0)

  return (
    <>
      <div>
    <main className='body'>    
    <header className='header'>
      <p>Minecraft</p>
    </header>
    </main>
    <footer className='footer'>
      <p>creado x adan, benja y gregorio</p>
      <div className='icons'>
      <a href="https://www.youtube.com/"><FaYoutube size={30} /></a>
      <a href="https://github.com/"><FaGithub size={30} /></a>
      <a href="https://www.instagram.com/"><FaInstagramSquare size={30} /></a>  
      </div>
    </footer>
   </div>
    </>
  )
}

export default App
