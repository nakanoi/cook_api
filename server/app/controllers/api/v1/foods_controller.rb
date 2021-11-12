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
    update_attributes = params[:updates]
    new_attributes = params[:news]
    exist_food_ids = current_api_v1_user.foods.pluck(:id)
    for update in update_attributes.pluck(:id)
      if not exist_food_ids.include?(update)
        render json: {
          status: 400,
          message: "Update params contains non exist id."
        }
        return
      end
    end

    if update_attributes.present?
      Food.upsert_all(update_attributes)
    end
    if new_attributes.present?
      Food.insert_all(new_attributes)
    end

    render json: {
      status: 200,
      message: "Successfully updated all params.",
      update_attributes: update_attributes,
      new_attributes: new_attributes,
    }
  end
end
