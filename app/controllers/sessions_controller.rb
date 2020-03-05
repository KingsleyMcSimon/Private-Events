class SessionsController < ApplicationController
  
  def create
    user = User.find_by(id: params[:session][:id])
    if user
    log_in user redirect_to user
    else 
    flash.now[:danger] = 'No such User Exit' 
    render :new
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
