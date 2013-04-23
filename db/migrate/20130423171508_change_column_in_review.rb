class ChangeColumnInReview < ActiveRecord::Migration
  def up
    change_column :reviews, :text, :text, :limit => 16777215
  end

  def down
  end
end
