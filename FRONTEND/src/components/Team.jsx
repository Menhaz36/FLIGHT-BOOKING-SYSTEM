import React from 'react'
import About from './About.jsx'
const Team = () => {

  const people=[
    {
        pname: 'Menhazul Abdin',
        role: 'Student, 3rd Year',
        description: 'Passionate about web development and database management. Enjoys working on innovative projects and learning new technologies.',
    },
    {
        pname: 'Ruchika Sharma',
        role: 'Student, 3rd Year',
        description: 'Passionate about web development and database management. Enjoys working on innovative projects and learning new technologies.',
    },
    {
        pname: 'Zara Fatma',
        role: 'Student, 3rd Year',
        description: 'Passionate about web development and database management. Enjoys working on innovative projects and learning new technologies.',
    }
    

  ]  

  return (
    <div className="bg-black py-20 flex flex-wrap justify-center gap-15">
            {people.map((person, idx) => (
                <About key={idx} {...person} />
            ))}
        </div>
  )
}

export default Team