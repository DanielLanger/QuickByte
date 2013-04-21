class CreateGroupMealParticipants < ActiveRecord::Migration
  def change
    create_table :group_meal_participants do |t|
      t.integer :user_id
      t.integer :group_meal_id

      t.timestamps
    end
  end
end
