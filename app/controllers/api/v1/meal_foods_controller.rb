class Api::V1::MealFoodsController < ApplicationController
  def create
    meal         = Meal.find(params[:meal_id])
    food         = Food.find(params[:id])
    food.meal_id = meal.id
    message      = "Successfully added #{food.name} to #{meal.name}"
    render json: { message: message }, status: 201
  rescue ActiveRecord::RecordNotFound
    render status: 404
  end
end
