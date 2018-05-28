class DropSubscribersTable < ActiveRecord::Migration
	def up
  		drop_table :subscribers
	end
	def down
    	create_table :subscribers do |t|
			t.string :email
			t.integer :zip
			t.timestamps null: false
    	end
  	end

end
