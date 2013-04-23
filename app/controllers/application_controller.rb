class ApplicationController < ActionController::Base
  protect_from_forgery
  private

  #Helper Method to Get Current User
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  #Helper Method to get AutoComplete terms based on user
  def query  	
  	@query= "SELECT name FROM businesses, businesses_categories, businesses_schools WHERE businesses.id=businesses_categories.business_id and businesses.id= businesses_schools.business_id and businesses_schools.school_id= " + School.find_by_name(current_user.college).id.to_s + " and businesses_categories.category_id=361"
  end
  
  
  helper_method :query
  
  helper_method :current_user
end
