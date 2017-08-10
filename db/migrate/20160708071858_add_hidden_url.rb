class AddHiddenUrl < ActiveRecord::Migration
  def change
    add_column :comments, :picurl, :string

  end
end
