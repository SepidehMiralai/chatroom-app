import React, { useContext } from 'react';
import  {MContext} from './MyProvider';

class MessageList extends React.Component {
  constructor(props) {
    super(props);
    this.currentUser="John"
    this.msg=""
    this.state = {
      messages: [],
    };
    this.addNewMessage=this.addNewMessage.bind(this)
  }

  componentDidMount() {
    fetch('http://localhost:3000/api/v1/rooms/1/room_messages')
      .then(response => response.json())
      .then(data => this.setState({messages: data.data}));
      <MContext.Consumer>
        {(context) => (
        <p>{console.log(context.state.message)}</p>
        )}
      </MContext.Consumer>
      
      this.addNewMessage();
  }

  addNewMessage() {
    console.log('test')
    // console.log(this.state.context.message)
    const { messages } = this.state;
    const msgs = [...messages];
    if(msgs.length >= 15) {
      msgs.shift();
    }
    // msgs.push(message);
    this.setState({messages: msgs, errors: []});
  }

  render(){ 
    return (
        <div><h2>Message List</h2>
          <ol>
            {this.state.messages.map(message => (
                <p>{this.currentUser}<br/>
                    {message.content}</p>
                  
            ))}
          </ol>
        </div>
          )
        }
}

export default MessageList
