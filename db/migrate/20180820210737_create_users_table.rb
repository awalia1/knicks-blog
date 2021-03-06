class CreateUsersTable < ActiveRecord::Migration[5.2]
  def change
  		create_table :users do |t|
	    t.string :first_name
	    t.string :last_name
	    t.string :email
	    t.string :password_hash
	    t.date :birthday
	    t.datetime :created_at
	    t.datetime :updated_at
    end
    add_index :users, :email, unique: true
  end
end