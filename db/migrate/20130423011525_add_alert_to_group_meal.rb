class AddAlertToGroupMeal < ActiveRecord::Migration
  def change
    add_column :group_meals, :alert, :boolean
  end
end
