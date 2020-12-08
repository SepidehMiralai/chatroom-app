# Chat Application

### Backend features:


* There exists 3 models: User, Room , Message.

* Used devise simple_token_authentication gem for Api authentication.

* Used Postman App to test get and post requests.

* The following features have been implemented, and here is how to test them in Postman:

1. I can persist my chat messages. The `messages` method in `UsersController` is responsible for this task.<br/>
To test, I created a new post request with a json format and body including `content`, `created_at` and `room_id` fields. Also specified `X-User-Token` and `X-User-Email`and their values  in the header
part for authentication. (These fields are used by devise simple token authentication)
Sample post request:<br/> POST http://localhost:3000/api/v1/users/1/messages

2. I can persist messages in specific channels I join. The `messages` method in `RoomsController` is responsible for this task.<br/>
Similar to Feature 1 but the post request is different.Sample post request:<br/> POST http://localhost:3000/api/v1/rooms/1/messages
Also `room_id` is not included the message body.

3. I can see the list of all the available channels.<br/>
 To test, I created a get request to see the list of all chat rooms: GET http://localhost:3000/api/v1/rooms

4. I can look up other users and channels.<br/>
  To test I created get requests to see the list of all chat rooms and users:<br/> 
  GET http://localhost:3000/api/v1/rooms <br/>
  GET http://localhost:3000/api/v1/users

5. I can see chat statistics of users and channels. The `room_messages` method in RoomsController and `u_messages` method in UsersController are responsible for these tasks. Also the necessary routing is provided in `routes.rb` file.<br/>
 To test I created get requests to see list of messages of other users and chat rooms:<br/>
  GET http://localhost:3000/api/v1/rooms/1/room_messages <br/>
  GET http://localhost:3000/api/v1/users/1/u_messages


### frontend features:

A react app called `chatroom-ui` is created inside the `chatroom-app` main folder. There exists 3 components including `MessageList`, `RoomList` and `SendMessageForm` which are rendered inside `App.js`. The following features are implemented.<br/>
1. I can see the list of the channels.<br/>
   To test just execute `npm start` inside `chatroom-ui` and you should see the list of all channels(rooms).
