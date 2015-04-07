class CreatePrivateMessages < ActiveRecord::Migration
  def change
    create_table :private_messages do |t|
      t.text :content
      t.integer :user_id
      t.integer :report_id

      t.timestamps
    end
  end
end
