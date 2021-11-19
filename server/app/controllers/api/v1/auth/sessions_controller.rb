class Api::V1::Auth::SessionsController < ApplicationController
  def index
    if current_api_v1_user
      render json: current_api_v1_user,
        serializer: UserSerializer,
        status: 200,
        is_login: true,
        message: 'Logged in.'
    else
      render json: {
        status: 200,
        is_login: false,
        message: 'User does not exist.',
      }
    end
  end
end
