class Api::V1::MealFoodsController < ApplicationController
  before_action :set_food, :set_meal

  def create
    @food.meal_id = @meal
    message = "Successfully added #{@food.name} to #{@meal.name}"
    render json: { message: message }, status: 201
  end

  private

    def set_food
      @food = Food.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render status: 404
    end

    def set_meal
      @meal = Meal.find(params[:meal_id])
    rescue ActiveRecord::RecordNotFound
      render status: 404
    end
end
