class SessionsController < ApplicationController
  include SessionsHelper

  def new
  end

  def create
    user = User.find_by_username(params[:username])
    if user
      session[:user_id] = user.id
      session[:username] = user.username
      redirect_to root_url, notice: "Logged in!"
    else
      flash.now[:danger] = 'No such User Exit'
      render 'new'
    end
  end

  def destroy
    session[:user_id]=nil
    session[:username]=nil
    redirect_to root_url, notice: "Logged out"
  end
end
