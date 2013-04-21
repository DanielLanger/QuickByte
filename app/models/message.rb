class Message < ActiveRecord::Base
  attr_accessible :author, :text, :group_meal_id
end
