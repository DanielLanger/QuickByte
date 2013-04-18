class SessionsController < ApplicationController
 
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    puts("here!!!")
    redirect_to reviews_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end