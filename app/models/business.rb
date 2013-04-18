class Business < ActiveRecord::Base
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :schools
  attr_accessible :business_id, :city, :full_address, :name, :open, :photo_url, :review_count, :stars, :state, :url, :latitude, :longitude
end