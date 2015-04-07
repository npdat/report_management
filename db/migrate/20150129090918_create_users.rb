class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :address
      t.string :phone
      t.string :email
      t.string :is_admin

      t.timestamps
    end
  end
end
