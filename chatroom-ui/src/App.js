import React, { Component } from 'react';
import ReactDOM from 'react-dom';
import { Router, Route } from "react-router";
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