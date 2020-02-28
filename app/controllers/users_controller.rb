class UsersController < ApplicationController
    def new
        @user = User.new(user_params)
    end
    
    def create
      if @user = User.new(user_params)
         @user.save
         redirect_to @user
      else
         render :new
    end
    
    def show
        @user = User.find(user_params)
        @eventable = @events
        @events = @eventable.events
        @event = Event.new
    end
    
    private
    
    def user_params
        params.require(:user).permit(:username)
    end
end
