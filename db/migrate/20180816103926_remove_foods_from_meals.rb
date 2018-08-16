class RemoveFoodsFromMeals < ActiveRecord::Migration[5.2]
  def change
    remove_column :meals, :food_id, index: true
  end
end
