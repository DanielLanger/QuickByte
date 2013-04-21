class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :author
      t.text :text

      t.timestamps
    end
  end
end
