class Review < ActiveRecord::Base
  attr_accessible :business_id, :date, :review_id, :stars, :text, :user_id
end
