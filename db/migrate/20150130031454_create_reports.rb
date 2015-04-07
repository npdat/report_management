class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :reportname
      t.string :path
      t.integer :user_id

      t.timestamps
    end
  end
end
