class AddTermsBooleanToUsersModel < ActiveRecord::Migration
  def up
  	add_column :users, :terms, :boolean, null: false, default: false
  end
  def down
  	remove_column :users, :terms
  end
end
