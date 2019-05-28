class CreateChats < ActiveRecord::Migration
  def change
    create_table :chats do |t|
      t.string :room_name
      t.string :session_id

      t.timestamps null: false
    end
  end
end
