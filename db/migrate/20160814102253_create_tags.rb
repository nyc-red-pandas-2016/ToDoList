class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name, null: false
      t.integer :tagable_id, null: false
      t.string :tagable_type, null: false

      t.timestamps null: false
    end
  end
end
