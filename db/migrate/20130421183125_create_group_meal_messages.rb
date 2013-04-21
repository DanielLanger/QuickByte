class CreateGroupMealMessages < ActiveRecord::Migration
  def change
    create_table :group_meal_messages do |t|
      t.integer :message_id
      t.integer :group_meal_id

      t.timestamps
    end
  end
end
