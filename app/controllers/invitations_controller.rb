class InvitationsController < ApplicationController
  def new
    @invitation = Invitation.new
  end

  def create
    @event = Event.find_by(id: params[:event_user_id])
    current_user.attended_events << @event
    current_user.invitations.where('event_user_id = ?', params[:event_user_id]).first.update_attributes(attending: true)
    redirect_to current_user
  end
end
