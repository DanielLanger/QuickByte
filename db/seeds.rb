# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


School.delete_all
schoolPath = "/Users/Daniel/Desktop/QuickByte/public/schools.txt"
open(schoolPath) do |schools|
    schools.read.each_line do |school|
    sch=school.chomp
    School.create!(:name => sch) 
    end
end

Category.delete_all
categoryPath = "#{Rails.root}/public/categories.txt"
open(categoryPath) do |categories|
    categories.read.each_line do |category|
    cat=category.chomp
    Category.create!(:name => cat) 
    end
end

Review.delete_all
reviewsPath="#{Rails.root}/public/reviews.json"
reviews=JSON.parse(File.read(reviewsPath))
reviews.each do |r|
	Review.create!(r)
end

Business.delete_all
businessPath = "#{Rails.root}/public/business2.json"
businesses = JSON.parse(File.read(businessPath))
businesses.each do |business|
  Business.create!(business)
end

BusinessesSchools.delete_all
businessSchoolPath = "#{Rails.root}/public/business_schools.txt"
open(businessSchoolPath) do |bs|
    bs.read.each_line do |b|
		bArray=b.split(", ")
	   
		bus=bArray[0].chomp
		sch=bArray[1].chomp
		busFind= Business.find_by_business_id(bus)
		schFind= School.find_by_name(sch)
		if(busFind !=nil && schFind!=nil)
			bId= busFind.id
			sId= schFind.id		  	
			BusinessesSchools.create(:business_id => bId, :school_id => sId)  
		end
	end
end

BusinessesCategories.delete_all
businessCategoryPath = "#{Rails.root}/public/business_categories.txt"
open(businessCategoryPath) do |bc|
    bc.read.each_line do |b|
		bArray=b.split(", ")
	   
		bus=bArray[0].chomp
		cat=bArray[1].chomp
		busFind= Business.find_by_business_id(bus)
		catFind= Category.find_by_name(cat)
		if(busFind !=nil && catFind!=nil)
			bId= busFind.id
			cId= catFind.id		  	
			BusinessesCategories.create(:business_id => bId, :category_id => cId)  
		end
	end
end
