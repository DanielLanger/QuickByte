class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :review_id
      t.integer :stars
      t.string :date
      t.text :text
      t.string :business_id
      t.string :user_id

      t.timestamps
    end
  end
end
