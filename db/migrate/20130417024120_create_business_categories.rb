class CreateBusinessCategories < ActiveRecord::Migration
  def change
    create_table :business_categories do |t|
      t.integer :category_id
      t.integer :businesss_id

      t.timestamps
    end
  end
end
