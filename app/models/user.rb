class User < ActiveRecord::Base
  has_and_belongs_to_many :group_meals
  attr_accessible :college
  
  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
		user.provider = auth.provider
		user.uid = auth.uid
		user.name = auth.info.name
		user.oauth_token = auth.credentials.token
		user.oauth_expires_at = Time.at(auth.credentials.expires_at)
		user.email=auth.info.email
		user.image=auth.info.image
		user.location=auth.info.location
		user.facebook_url=auth.info.urls.Facebook
		puts("education here")
		@school=""
		puts(auth.extra.raw_info)
		if(auth.extra.raw_info.education !=nil)
			auth.extra.raw_info.education.each do |e|
				if e.type="College"
					@school=e.school.name
				end
			end
			user.college=@school
		end
		user.save!
  	end
  end
end
