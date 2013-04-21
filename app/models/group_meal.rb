class GroupMeal < ActiveRecord::Base
  has_and_belongs_to_many :users
  attr_accessible :meal, :proposed_end_time, :proposed_start_time, :set_end_time, :set_start_time
end
