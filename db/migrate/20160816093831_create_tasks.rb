class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :list_id, null: false
      t.string :task_name, null: false, unique: true
      t.boolean :completed, default: false
      t.timestamps null: false
    end
  end
end
