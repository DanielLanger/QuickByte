class Meal < ActiveRecord::Base
  attr_accessible :end_time, :host, :location, :start_time, :privacy_level
  validates :location, :presence => true
  
end
