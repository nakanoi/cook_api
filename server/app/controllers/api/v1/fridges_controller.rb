class Api::V1::FridgesController < ApplicationController
  before_action :authenticate_api_v1_user!, only: [:index, :show, :create]

  def index
    render json: current_api_v1_user.fridges
  end

  def show
    fridge = Fridge.find_by(
      id: params[:id],
      user_id: current_api_v1_user.id,
    )
    if fridge
      render json: {
        status: 200,
        fridge: fridge,
        foods: [],#fridge.foods,
        message: "Find the fridge."
      }
    else
      render json: {
        status: 404,
        fridge: nil,
        foods: [],
        message: "Doesn't exist the fridge"
      }
    end
  end

  def create
    fridge = Fridge.new(user_id: current_api_v1_user.id)
    if fridge.save
      render json: {
        status: 200,
        fridge_id: fridge.id,
        message: "Successfully created your new fridge.",
      }
    else
      render json: {
        status: 500,
        fridge_id: nil,
        message: "Failed to crate your new fridge.",
      }
    end
  end

end
