class AddFoodsToMeals < ActiveRecord::Migration[5.2]
  def change
    add_reference :meals, :food, foreign_key: true
  end
end
