class AddColumnToUser < ActiveRecord::Migration
  def change
    add_column :users, :participant, :integer
  end
end
