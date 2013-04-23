class AddAlertLocationToGroupMeal < ActiveRecord::Migration
  def change
    add_column :group_meals, :alert_location, :integer
  end
end
