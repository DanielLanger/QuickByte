class SessionsController < ApplicationController
 
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to meals_path
  end

  def destroy
    session[:user_id] = nil
    sleep 3
    redirect_to root_url
  end
end