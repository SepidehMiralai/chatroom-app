class Api::V1::MessagesController < Api::V1Controller
  
  def index
    messages = Message.all
    render json: {status: 'SUCCESS', message:'Loaded messages', data:messages}, status: :ok
  end

end