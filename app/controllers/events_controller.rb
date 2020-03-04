class EventsController < ApplicationController
    
    def index
        @event = Event.all
    end
    
    def new
        @event = Event.new
    end
    
    def create
        @event = @current_user.build_event(event_params)
        if @event.save
           redirect_to events_path
           flash[:notice] = "The event was successfully created"
       else
           render 'new'
           flash[:notice] = "There was an error creating your event"
    end
    
    def show
    end
    
    private
    
    def event_params
        params.require(:event).permit(:name,:description,:date,:location)
    end
end
