class Api::V1::FoodsController < ApplicationController
  before_action :set_food, only: %i[show]

  def index
    render json: Food.all
  end

  def show
    render json: @food
  end

  def create
    food = Food.new(food_params)
    food.save!
    render json: food, status: 201
  end

  private

    def set_food
      @food = Food.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render status: 404
    end

    def food_params
      params.require(:food).permit(:name, :calories)
    end
end
