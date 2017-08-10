class AddLevelIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :level_id, :integer
  end
end
