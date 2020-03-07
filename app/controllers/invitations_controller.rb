class InvitationsController < ApplicationController
    def new
        @invitation = Invitation.new
    end
    
    def create
        @event = Event.find_by(id: params[:user_event_id])
        current_user.attended_events << @event
        current_user.invitations.where('user_event_id = ?', params[:user_event_id]).first.update_attributes(attending: true)
        redirect_to current_user
    end
end
