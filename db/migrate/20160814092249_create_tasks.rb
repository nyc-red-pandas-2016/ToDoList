class CreateTasks < ActiveRecord::Migration
  def change
	create_table :tasks do |t|
		t.string :name, null: false
		t.string :description, null: false
		t.integer :list_id, null: false
    t.string :status, default: "false", null: false

		t.timestamps null: false
	end
  end
end
