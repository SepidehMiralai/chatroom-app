import React, { Component } from 'react';
import ReactDOM from 'react-dom';
import { Router, Route } from "react-router";
import './App.css';
import RoomList from './components/RoomList'
import MessageList from './components/MessageList'
import SendMessageForm from './components/SendMessageForm'

class App extends Component {

  constructor(props) {
    super(props);
    // this.currentUser= "John"
    // this.authToken= "AThhjbpU8T3fycLEx6aS"
    this.state = {
      message: ''
    };
    this.myCallback = this.myCallback.bind(this); 
    
  }
  myCallback = (newMessage) => {
    this.setState({message: newMessage});
    //  console.log(this.state.message);
  }
  // componentDidMount() {
  //   this.myCallback;
  // }


  render() {
    return (
      <div>
        <div className="app">
          <div class="split left"> <RoomList /> </div>
          <div class="split right"> <MessageList newMessage = {this.state.message}/> </div>
          <div class="below"><SendMessageForm callbackFromApp = {this.myCallback} /></div>
        </div> 
      </div>
    );
  }
}

export default App;