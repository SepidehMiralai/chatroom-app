import React, { Component } from 'react';
import './App.css';
import RoomList from './components/RoomList'

class App extends Component {
  render() {
    return (
      <div className="container">
        <div className="header">
          <h1>Room Channel List</h1>
        </div>
        <RoomList />
      </div>
    );
  }
}

export default App;