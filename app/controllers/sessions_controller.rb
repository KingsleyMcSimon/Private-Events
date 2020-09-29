class SessionsController < ApplicationController
  include SessionsHelper

  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user
      sign_in user
      redirect_to user
    else
      flash.now[:danger] = 'No such User Exit'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
