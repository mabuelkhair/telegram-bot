class CreateConversations < ActiveRecord::Migration[6.0]
  def change
    create_table :conversations, id: false do |t|
      t.bigint :id, primary_key: true
      t.string :conversation_type
      t.string :title

      t.timestamps
    end
    add_index :conversations, :conversation_id
  end
end
