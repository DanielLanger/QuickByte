class RenameBusinessCategoriesToBusinessesCategories < ActiveRecord::Migration
  def up
    rename_table :business_categories, :businesses_categories
  end

  def down
  end
end
