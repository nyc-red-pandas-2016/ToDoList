class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.references :list, foreing_key:true
      t.text :description, null:false

      t.timestamps null:false
    end
      add_index :tasks, :list_id
  end
end
