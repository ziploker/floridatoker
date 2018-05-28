class AddRoot2IdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :root2_id, :integer
  end
end
