class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name, null: false
      t.integer :list_id, null: false
      t.string :status
      t.timestamps null: false
    end
  end
end
