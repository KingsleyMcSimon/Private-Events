class EventsController < ApplicationController
    
    def index
         @upcoming = Event.upcoming
         @previous = Event.past
    end
    
    def new
        @event = Event.new
    end
    
    def create
        @event = current_user.made_events.build(event_params)
        if @event.save
           redirect_to current_user
           flash[:success] = "The event was successfully created"
        else
           flash.now[:danger] = "There was an error creating your event"
           @events = current_user.made_events
           @going = current_user.attended_events
           @event = current_user.made_events.build
           @upcoming = @going.upcoming
           @previous = @going.past
           render 'users/show'
        end
    end
    
    def show
        @event = Event.find_by(id: params[:id])
        @attendees = @event.attendees
    end
    
    private
    
    def event_params
        params.require(:event).permit(:name,:description,:date,:location)
    end
end
