class CreateGroupMeals < ActiveRecord::Migration
  def change
    create_table :group_meals do |t|
      t.integer :meal
      t.datetime :proposed_start_time
      t.datetime :proposed_end_time
      t.datetime :set_start_time
      t.datetime :set_end_time

      t.timestamps
    end
  end
end
