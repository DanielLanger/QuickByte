class FixColumnName < ActiveRecord::Migration
  def up
    rename_column :businesses_categories, :businesss_id, :business_id
  end

  def down
  end
end
