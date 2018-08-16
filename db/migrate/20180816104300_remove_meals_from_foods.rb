class RemoveMealsFromFoods < ActiveRecord::Migration[5.2]
  def change
    remove_column :foods, :meal_id, index: true
  end
end
