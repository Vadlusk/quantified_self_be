class Api::V1::FoodsController < ApplicationController
  before_action :set_food, only: %i[show update]

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
  rescue ActiveRecord::RecordInvalid
    render status: 400
  end

  def update
    @food.update(food_params)
    @food.save!
    render json: @food
  rescue ActiveRecord::RecordInvalid
    render status: 400
  end

  private

    def set_food
      @food = Food.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render status: 404
    end

    def food_params
      params.require(:food).permit(:name, :calories)
    rescue ActionController::ParameterMissing
    end
end
