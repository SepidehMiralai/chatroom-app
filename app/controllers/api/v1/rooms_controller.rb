class Api::V1::RoomsController < Api::V1Controller
  acts_as_token_authentication_handler_for User, only: :messages
  
  def index
    rooms = Room.all
    render json: {status: 'SUCCESS', message:'Loaded rooms', data:rooms}, status: :ok
  end

  def messages
    @room = Room.find(params[:id])

    # Receiving all the chat messages of the user for this given room
    # params[:messages]
    # [
    #   {created_at: 512748132781, content: "qwdqwdqui wdhqwdu qwudi qhwdiu quiw d"},
    #   {created_at: 512748132781, content: "qwdqwdqui wdhqwdu qwudi qhwdiu quiw d"},
    #   {created_at: 512748132781, content: "qwdqwdqui wdhqwdu qwudi qhwdiu quiw d"},
    #   {created_at: 512748132781, content: "qwdqwdqui wdhqwdu qwudi qhwdiu quiw d"},
    #   {created_at: 512748132781, content: "qwdqwdqui wdhqwdu qwudi qhwdiu quiw d"},
    #   {created_at: 512748132781, content: "qwdqwdqui wdhqwdu qwudi qhwdiu quiw d"}
    # ]

    @room.persist_messages_for_user!(messages_params[:messages], current_user)

    # Response
    # @json_object = RoomsSerializer.new(@room).as_json
    render json: {status: :success}, status: 200
  end

  protected

  def messages_params
    params.permit(messages: [:content, :created_at])
  end
end