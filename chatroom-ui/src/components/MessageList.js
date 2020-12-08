import React from 'react';

class MessageList extends React.Component {
  constructor(props) {
    super(props);
    this.currentUser="John"
    this.newMessage='';
    this.state = {
      messages: [],
    };
    this.addNewMessage=this.addNewMessage.bind(this)
  }

  componentDidMount() {
    fetch('http://localhost:3000/api/v1/rooms/1/room_messages')
      .then(response => response.json())
      .then(data => this.setState({messages: data.data}));
      // console.log(this.newMessage);
      // this.setState({message: this.props.newMessage});
       
      if (this.newMessage!=='')
        this.addNewMessage();
      
  }

  addNewMessage() {
    const { messages } = this.state.messages;
    const msgs = [...messages];
    if(msgs.length >= 15) {
      msgs.shift();
    }
    
    msgs.push(this.newMessage);
    this.setState({messages: msgs, errors: []});
  }

  render(){ 
    return (
        <div><h2>Message List</h2>
        {this.newMessage = this.props.newMessage}
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
