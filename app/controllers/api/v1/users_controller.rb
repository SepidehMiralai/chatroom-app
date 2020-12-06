class Api::V1::UsersController < Api::V1Controller
  acts_as_token_authentication_handler_for User

  def index
    rooms = User.all
    render json: {status: 'SUCCESS', message: 'Loaded users', data: rooms}, status: :ok
  end

  def messages
    # Receiving all the chat messages of the user for ALL rooms
    # params[:messages]
    # [
    #   {created_at: 512748132781, content: "qwdqwdqui wdhqwdu qwudi qhwdiu quiw d", room_id: 1},
    #   {created_at: 512748132781, content: "qwdqwdqui wdhqwdu qwudi qhwdiu quiw d", room_id: 1},
    #   {created_at: 512748132781, content: "qwdqwdqui wdhqwdu qwudi qhwdiu quiw d", room_id: 1},
    #   {created_at: 512748132781, content: "qwdqwdqui wdhqwdu qwudi qhwdiu quiw d", room_id: 1},
    #   {created_at: 512748132781, content: "qwdqwdqui wdhqwdu qwudi qhwdiu quiw d", room_id: 1},
    # ]

    current_user.persist_messages!(messages_params[:messages])

    render json: {status: :success}, status: 200
  end

  protected

  def messages_params
    params.permit(messages: [:content, :created_at, :room_id])
  end
end