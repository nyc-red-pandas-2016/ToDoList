class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :description, null: false
      t.boolean :complete, default: false
      t.integer :list_id
      t.integer :user_id

      t.timestamps
    end
  end
end
