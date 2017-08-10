class RemoveColumn < ActiveRecord::Migration
  def self.up
    remove_column :feedbacks, :subject
  end
  
  def self.down
    add_column :feedbacks, :subject
  end
end
