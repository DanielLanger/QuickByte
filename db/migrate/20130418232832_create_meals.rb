class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.integer :host
      t.datetime :start_time
      t.datetime :end_time
      t.integer :location

      t.timestamps
    end
  end
end
