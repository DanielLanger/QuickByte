class AddGroupMealIdToMessage < ActiveRecord::Migration
  def change
    add_column :messages, :group_meal_id, :integer
  end
end
