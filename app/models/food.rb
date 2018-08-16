class Food < ApplicationRecord
  validates :name, presence: true
  validates :calories, presence: true
  has_many :meal_foods
  has_many :meals, through: :meal_foods
end
