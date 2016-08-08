class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.references :user, foreing_key:true
      t.string :name, null:false

      t.timestamps null:false
    end
    add_index :lists,:user_id
  end
end
