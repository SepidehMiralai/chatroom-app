class Api::V1::UsersController < Api::V1Controller
  acts_as_token_authentication_handler_for User

  def show
    users = User.all
    render json: {status: 'SUCCESS', message: 'Loaded users', data: users}, status: :ok
  end

  def messages
    current_user.persist_messages!(messages_params[:messages])
    render json: {status: :success}, status: 200
  end

  def u_messages
    @user = User.find(params[:id])
    messages = @user.messages
    render json: {status: 'SUCCESS', message:'Loaded this rooms messages', data:messages}, status: :ok
  end

  protected

  def messages_params
    params.permit(messages: [:content, :created_at, :room_id])
  end
end