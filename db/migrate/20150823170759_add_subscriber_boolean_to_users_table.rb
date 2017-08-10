class AddSubscriberBooleanToUsersTable < ActiveRecord::Migration
  def up
  	add_column :users, :subscriber, :boolean, null: false, default: false
  end
  def down
  	remove_column :users, :subscriber
  end

end
