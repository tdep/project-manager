import { useState, useEffect, useRef } from 'react'
import Cookies from 'js-cookie'
import './App.css';

function Profile ({user}) {
  return (
    <h3>{user.username}</h3>
  )
}

function App() {
  const [user, setUser] = useState(null)
  const form = useRef()

  useEffect(() => {
    const loadUser = async () => {
      let req = await fetch("http://localhost:3000/me", {
        headers: {Authorization: Cookies.get('token')}
      })
      let res = await req.json()
      if (res.user) setUser(res.user)
    }
    if (Cookies.get('token')) loadUser()
  }, [])

  const logout = () => {
    Cookies.remove('token')
    setUser(null)
  }

  const handleSubmit = async (e) => {
    e.preventDefault()
    let formData = new FormData(form.current)
    let req = await fetch("http://localhost:3000/login", {
      method: 'POST',
      body: formData
    })
    let res = await req.json()
    console.log("Res", res)
    Cookies.set('token', res.token)
    setUser(res.user)
  }
  return (
    <div className="App">
      { user && <Profile user={user} /> }
      <form onSubmit={handleSubmit} ref={form}>
        <input name='email' type='email' placeholder="email" />
        <input name='password' type='text' placeholder='password' />
        <button>LOGIN</button>
      </form>
      <br />
      <button onClick={logout}>LOGOUT</button>
    </div>
  );
}

export default App;
