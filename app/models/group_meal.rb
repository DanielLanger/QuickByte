class GroupMeal < ActiveRecord::Base
  attr_accessible :meal, :proposed_end_time, :proposed_start_time, :set_end_time, :set_start_time
end
