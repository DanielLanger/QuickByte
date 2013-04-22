class Meal < ActiveRecord::Base
  attr_accessible :end_time, :host, :location, :start_time, :privacy_level, :user_tokens
  validates :location, :presence => true
  attr_reader :user_tokens
  
  
end
