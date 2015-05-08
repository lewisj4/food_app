class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|

    	t.string :name
    	t.integer :calories
    	t.integer :fat_calories
    	t.integer :carbohydrates
    	t.integer :fats 
    	t.integer :protein

        t.timestamps
    end
  end
end
