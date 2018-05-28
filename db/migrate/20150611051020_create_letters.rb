class CreateLetters < ActiveRecord::Migration
  def change
    create_table :letters do |t|
      t.string :subject
      t.text :body
      t.string :name
      t.string :address
      t.string :city
      t.string :zip
      t.string :email1
      t.string :email2
      t.string :name1
      t.string :name2
      t.string :ip

      t.timestamps null: false
    end
  end
end
