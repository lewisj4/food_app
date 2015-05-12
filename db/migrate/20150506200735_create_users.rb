class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|

    	t.string :username, :null => false
    	t.string :password_digest
    	t.string :full_name, :null => false
    end
  end
end
