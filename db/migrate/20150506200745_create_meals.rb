class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|

    	t.string :name

    	t.belongs_to :user

    	t.timestamps
    end
  end
end
