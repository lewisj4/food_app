class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|

    	t.string :foods
    	t.integer :user_id
    end
  end
end
