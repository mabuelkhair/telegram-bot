class CreateConversations < ActiveRecord::Migration[6.0]
  def change
    create_table :conversations do |t|
      t.bigint :conversation_id
      t.string :conversation_type
      t.string :title

      t.timestamps
    end
    add_index :conversations, :conversation_id
  end
end
