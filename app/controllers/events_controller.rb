class EventsController < ApplicationController
    
    def index
    end
    
    def new
    end
    
    def create
    end
    
    def show
    end
    
    private
    
    def event_params
        params.require(:event).permit(:name,:description,:date,:location)
    end
end
