class Meal < ActiveRecord::Base
  attr_accessible :end_time, :host, :location, :start_time, :privacy_level, :user_tokens
  before_validation :location_exists
  attr_reader :user_tokens
  
  validate :date_must_be_in_future
  validate :start_greater_end
  
  def start_greater_end
    if start_time > end_time
      errors.add :base, "Start time should Be Less Than End Time!"
    end
  end
  
  def date_must_be_in_future
    if start_time < DateTime.now
      errors.add(:start_time, "Start Time Must Be In Future")
    end
  end
  
  def location_exists
    if location == " "
    	errors.add(:location, "Please Select A Location")
    end
  end
  
  
end
