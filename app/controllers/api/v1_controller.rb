class Api::V1Controller < ApplicationController
  respond_to :json

  # create a generic respond method that handles exception
  rescue_from Exception do |exception|
    message = request.local? ? exception.message : "Internal Server Error"
    render json: {status: :error, message: message}, status: 500
  end
end