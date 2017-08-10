class AddRoot3IdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :root3_id, :integer
  end
end
