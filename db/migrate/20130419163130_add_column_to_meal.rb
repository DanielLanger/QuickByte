class AddColumnToMeal < ActiveRecord::Migration
  def change
    add_column :meals, :privacy_level, :string
  end
end
