class AddAlertLocationToUsers < ActiveRecord::Migration
  def change
    add_column :users, :alert_location, :integer
  end
end
