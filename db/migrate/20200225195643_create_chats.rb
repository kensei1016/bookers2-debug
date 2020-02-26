class CreateChats < ActiveRecord::Migration[5.2]
  def change
    create_table :chats do |t|
      t.references :send_user
      t.references :recv_user
      t.references :room

      t.text :message, null: false

      t.timestamps
    end
  end
end
