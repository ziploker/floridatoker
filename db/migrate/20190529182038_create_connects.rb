class CreateConnects < ActiveRecord::Migration
  def change
    create_table :connects do |t|
      t.string :ip

      t.timestamps null: false
    end
  end
end
