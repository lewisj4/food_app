class CreateFoodsMeals < ActiveRecord::Migration
  def change
    create_join_table :meals, :foods do |t|
    	t.index :meal_id
    	t.index :food_id
    end
  end
end
