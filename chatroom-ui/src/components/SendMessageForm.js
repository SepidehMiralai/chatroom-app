
import React, { useContext } from 'react';

class SendMessageForm extends React.Component {

  constructor(){
    super()
    this.state = {
      message: ''
    }
    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this)
  }

  handleChange(e){
    this.setState({
      message: e.target.value
    })
    
  }

  handleSubmit(e){
    e.preventDefault()
    this.props.callbackFromApp(this.state.message);
  }

  render(){ 
    
    return (
      <div>
        <form>
          {/* onSubmit={this.handleSubmit} */}
          <input 
            className="messagefield"
            onChange = {this.handleChange}
            value = {this.state.message}
            placeholder = "Type your message and hit Enter"
            type = "text" />
           <button type="submit" onClick={this.handleSubmit}>Send</button> 
        </form>
        
      </div>
    )
    }
}

export default SendMessageForm
