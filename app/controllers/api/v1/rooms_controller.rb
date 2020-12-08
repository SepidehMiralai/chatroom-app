class Api::V1::RoomsController < Api::V1Controller
  acts_as_token_authentication_handler_for User, only: :messages
  
  def index
    rooms = Room.all
    render json: {status: 'SUCCESS', message:'Loaded rooms', data:rooms}, status: :ok
  end

  def messages
    @room = Room.find(params[:id])

    @room.persist_messages_for_user!(messages_params[:messages], current_user)

    render json: {status: :success}, status: 200
  end

  def room_messages
    @room = Room.find(params[:id])
    messages = @room.messages
    render json: {status: 'SUCCESS', message:'Loaded this rooms messages', data:messages}, status: :ok
  end


  protected

  def messages_params
    params.permit(messages: [:content, :created_at])
  end
end