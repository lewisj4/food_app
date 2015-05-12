class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|

    	t.string :name, :null => false
    	t.integer :calories
    	t.integer :fat_calories
    	t.integer :carbohydrates
    	t.integer :fats 
    	t.integer :protein

        t.belongs_to :meal

        t.timestamps
    end
  end
end
