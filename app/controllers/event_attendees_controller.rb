class EventAttendeesController < ApplicationController
  before_action :set_event_attendee, only: [:show, :edit, :update, :destroy]

  def index
    @event_attendees = EventAttendee.all
  end

  def show() end

  def new
    @event_attendee = EventAttendee.new
  end

  def edit() end

  def create
    @event_attendee = EventAttendee.new(event_attendee_params)

    respond_to do |format|
      if @event_attendee.save
        format.html { redirect_to @event_attendee, notice: 'Event attendee was successfully created.' }
        format.json { render :show, status: :created, location: @event_attendee }
      else
        format.html { render :new }
        format.json { render json: @event_attendee.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @event_attendee.update(event_attendee_params)
        format.html { redirect_to @event_attendee, notice: 'Event attendee was successfully updated.' }
        format.json { render :show, status: :ok, location: @event_attendee }
      else
        format.html { render :edit }
        format.json { render json: @event_attendee.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @event_attendee.destroy
    respond_to do |format|
      format.html { redirect_to event_attendees_url, notice: 'Event attendee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_event_attendee
    @event_attendee = EventAttendee.find(params[:id])
  end

  def event_attendee_params
    params.require(:event_attendee).permit(:attendee_id, :event_id)
  end
end
