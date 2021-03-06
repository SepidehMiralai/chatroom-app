import React from 'react';

class RoomList extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      rooms: [],
    };
  }

  componentDidMount() {
    fetch('http://localhost:3000/api/v1/rooms')
      .then(response => response.json())
      .then(data => this.setState({rooms: data.data}));
  }

  render(){ 
    return (
        <div>
          <h2>Channel List</h2>
          <ol>
            {this.state.rooms.map(room => (
              <li key={room.id}>
                {room.title}
                {room.title}
              </li>
            ))}
          </ol>
        </div>
    );
  }
}

export default RoomList