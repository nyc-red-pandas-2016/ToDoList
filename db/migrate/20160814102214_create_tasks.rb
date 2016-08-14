class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.boolean :status, null: false
      t.references :list, null: false
      t.references :user, null: false

      t.timestamps null: false
    end
  end
end
