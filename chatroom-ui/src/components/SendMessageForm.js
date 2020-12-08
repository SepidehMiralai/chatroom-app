
import React, { useContext } from 'react';
import  {MContext} from './MyProvider';


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
    // console.log(this.state.message)
  }

  render(){ 
    
    return (
      <div>
        <form 
          onSubmit={this.handleSubmit}>
          <input 
            className="messagefield"
            onChange = {this.handleChange}
            value = {this.state.message}
            placeholder = "Type your message and hit Enter"
            type = "text" />
        </form>
        <MContext.Consumer>
        {(context) => (
       <button onClick={()=>{context.setMessage("New Arrival")}}>Send</button>
       )}
        </MContext.Consumer>
      </div>
    )
    }
}

export default SendMessageForm
