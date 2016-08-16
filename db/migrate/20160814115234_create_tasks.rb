class CreateTasks < ActiveRecord::Migration
  def change
    create_table(:tasks) do |t|
      t.string :description, null: false
      t.boolean :complete, null: false, default: false
      t.integer :list_id, null: false
      t.integer :task_tag_id

      t.timestamps
    end
  end
end
