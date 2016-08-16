class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :list_name, null: false
      t.integer :user_id, null: false

      t.timestamps(null: false)
    end
  end
end
