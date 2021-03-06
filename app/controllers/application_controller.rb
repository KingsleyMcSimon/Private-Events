class ApplicationController < ActionController::Base
  include SessionsHelper
  helper_method :current_user

  def sign_in(user)
    cookies.permanent[:id] = user.id
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
  end

  def authenticate_user
    return unless session[:user_id].nil?

    flash[:notice] = 'You need to be logged in to perform this action'
    redirect_to root_url
  end
end
