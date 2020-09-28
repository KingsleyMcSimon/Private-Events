class ApplicationController < ActionController::Base
  include SessionsHelper

  def sign_in(user)
    cookies.permanent[:id] = user.id
  end

  def current_user
    @current_user ||= User.find_by_id!(cookies[:id]) if cookies[:id]
  end
  helper_method :current_user
end
