Room.destroy_all
User.destroy_all

Room.create!(
  title: "General"
)

Room.create!(
  title: "Dev Chat"
)

User.create!(
  email: "john@doe.com",
  password: '12345678',
  password_confirmation: '12345678',
  user_name: 'johndoe',
  authentication_token: 'AThhjbpU8T3fycLEx6aS'
)
