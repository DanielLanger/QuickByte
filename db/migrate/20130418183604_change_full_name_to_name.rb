class ChangeFullNameToName < ActiveRecord::Migration
  def up
  rename_column :users, :full_Name, :name
  end

  def down
  end
end
