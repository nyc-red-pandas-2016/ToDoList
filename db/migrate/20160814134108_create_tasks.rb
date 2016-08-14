class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.references :list
      t.references :user
      t.string :description, null: false
      t.boolean :complete, default: false

      t.timestamps
    end
  end
end
