class Food < ApplicationRecord
  validates :name, presence: true
  validates :calories, presence: true
  belongs_to :meal, optional: true
end
