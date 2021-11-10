class Api::V1::Auth::SessionsController < ApplicationController
  def index
    if current_api_v1_user
      render json: {
        status: 200,
        is_login: true,
        user: current_api_v1_user,
        message: 'Logged in.',
      }
    else
      render json: {
        status: 401,
        is_login: false,
        user: {},
        message: 'User does not exist.',
      }
    end
  end
end
