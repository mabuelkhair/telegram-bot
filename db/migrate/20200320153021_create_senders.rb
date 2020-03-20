class CreateSenders < ActiveRecord::Migration[6.0]
  def change
    create_table :senders do |t|
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
  end
end
