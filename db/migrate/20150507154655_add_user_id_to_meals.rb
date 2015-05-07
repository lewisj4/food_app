class AddUserIdToMeals < ActiveRecord::Migration
  def change
  	add_column :meals, :user_id, :integer
  	add_foreign_key :meals, :users
  end
end
