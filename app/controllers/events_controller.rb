class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.all
  end

  def show
    @check_user = event_check_current_user
  end

  def new
    @event = Event.new
  end

  def edit
  end

  def create
    respond_to do |format|
      if event_params_create.save
        format.html { redirect_to @event, notice: "Evenement cree." }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @event.update(event_params_update)
        format.html { redirect_to @event, notice: 'Evenement mis a jour.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Evenement detruit.' }
      format.json { head :no_content }
    end
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params_create
      @event =  Event.new(params.require(:event).permit(:name, :date, :place, :price, :description))
      @event.creator = current_user
      @event
    end

    def event_params_update
      params.require(:event).permit(:name, :date, :place, :price, :description)
    end

    def event_check_current_user
      true if @event.creator == current_user
    end

end
