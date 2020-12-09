class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  respond_to :json, :html

  # acts_as_token_authentication_handler_for User

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name])
  end
end
