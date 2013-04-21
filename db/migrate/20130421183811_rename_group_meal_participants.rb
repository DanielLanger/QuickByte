class RenameGroupMealParticipants < ActiveRecord::Migration
  def up
    rename_table :group_meal_participants, :group_meals_participants
  end

  def down
  end
end
