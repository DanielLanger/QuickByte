class CreatePrivates < ActiveRecord::Migration
  def change
    create_table :privates do |t|
      t.integer :user_id
      t.integer :meal_id

      t.timestamps
    end
  end
end
