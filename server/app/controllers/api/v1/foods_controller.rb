class Api::V1::FoodsController < ApplicationController
  before_action :authenticate_api_v1_user!, only: [:index, :show, :create]

  def index
    render json: current_api_v1_user.foods
  end

  def show
    food = Food.find_by(
      id: params[:id],
      user: current_api_v1_user,
    )
    if food
      render json: {
        status: 200,
        food: food,
      }
    else
      render json: {
        status: 404,
        food: nil,
      }
    end
  end

  def create
    attributes = params[:attributes]
    all_foods = {}
    Food.all.each do |food|
      all_foods[food.token] = food.user_id
    end

    if not attributes.is_a?(Array)
      render json: {
        status: 400,
        message: "You have to set Array in 'attributes'.",
        attributes: attributes,
      }
    end

    for attribute in attributes
      if all_foods[attribute[:token]] and\
         all_foods[attribute[:token]] != attribute[:user_id]
        render json: {
          status: 400,
          message: "One of your foods belongs to other user.",
          attributes: attributes,
        }
        return
      end
    end

    if attributes.present?
      Food.upsert_all(attributes)
    end

    render json: {
      status: 200,
      message: "Successfully updated all params.",
      attributes: attributes,
    }
  end
end
