class DropGroupMealMessage < ActiveRecord::Migration
  def up
    drop_table :group_meal_messages
  end

  def down
  end
end
