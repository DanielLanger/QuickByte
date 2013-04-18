class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.string :business_id
      t.string :full_address
      t.boolean :open
      t.string :photo_url
      t.string :city
      t.integer :review_count
      t.string :name
      t.string :url
      t.string :state
      t.integer :stars

      t.timestamps
    end
  end
end
