import React, { Component } from 'react';
import ReactDOM from 'react-dom';
import { Router, Route } from "react-router";
import './App.css';
import MyProvider from './components/MyProvider'
import RoomList from './components/RoomList'
import MessageList from './components/MessageList'
import SendMessageForm from './components/SendMessageForm'

class App extends Component {

  // constructor(props) {
  //   super(props);
  //   this.currentUser= "John"
  //   this.authToken= "AThhjbpU8T3fycLEx6aS"
  //   this.state = {
  //     messages: [],
  //   };
  //   this.onNewMessage = this.onNewMessage. bind(this); 
  //   this.sendMessage=this.sendMessage.bind(this)
  // }

  // componentDidMount() {
  //    this.sendMessage(text)
  // }

  // sendMessage(text){
  //   this.sendMessage({
  //   text, 
  //   roomId: 1})
  // }

  render() {
    return (
      <div>
        <MyProvider>
          <div className="app">
            <div class="split left"> <RoomList /> </div>
            <div class="split right"> <MessageList /> </div>
            <div class="below"><SendMessageForm /></div>
          </div>
        </MyProvider>
      </div>
    );
  }
}

export default App;