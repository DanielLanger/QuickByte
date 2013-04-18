class AddFullNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :full_Name, :string
  end
end
