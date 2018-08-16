class Api::V1::MealFoodsController < ApplicationController
  before_action :set_meal, :set_food

  def create
    @food.meals << @meal
    message = "Successfully added #{@food.name} to #{@meal.name}"
    render json: { message: message }, status: 201
  end

  def destroy
    meal_food = @meal.meal_foods.where(food_id: params[:id])
    meal_food.first.destroy
    message = "Successfully removed #{@food.name} from #{@meal.name}"
    render json: { message: message }, status: 200
  end

  private

    def set_meal
      @meal = Meal.find(params[:meal_id])
    rescue ActiveRecord::RecordNotFound
      render status: 404
    end

    def set_food
      @food = Food.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render status: 404
    end
end
