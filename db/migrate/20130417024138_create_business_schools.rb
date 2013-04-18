class CreateBusinessSchools < ActiveRecord::Migration
  def change
    create_table :business_schools do |t|
      t.integer :school_id
      t.integer :business_id

      t.timestamps
    end
  end
end
