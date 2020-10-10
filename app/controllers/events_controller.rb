class EventsController < ApplicationController
  before_action :set_event, only: %i[show edit update destroy attend]

  before_action :authenticate_user, except: %i[index show]

  def index
    @event = Event.all
    @upcoming = Event.upcoming # next_events
    @previous = Event.previous # prov_events
  end

  def show
    @event = Event.find_by(id: params[:id])
    # @attendees = @event.attendees
  end

  def attend
    user = current_user
    if !user.already_attend?(@event)
      user.invitations.build(event_id: @event.id).save
      flash[:notice] = "User #{user.username} added to attend #{@event.name}"
    else
      flash[:notice] = "User #{user.username} already attending to this event!"
    end
    redirect_to @event
  end

  # GET events/new
  def new
    user = current_user
    @event = user.events.build
    # @event = Event.new
  end

  # GET /events/1/edit
  def edit; end

  def create
    user = User.find_by_username(session[:username])
    @event = user.events.build(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :description, :date, :location)
  end
end
