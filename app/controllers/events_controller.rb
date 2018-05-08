class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy, :subscribe, :create_payement, :show_payement]

  def index
    @events = Event.all
  end

  def show
    @check_user = event_check_current_user
  end

  def new
    @event = Event.new
  end

  def edit() end

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

  def subscribe
    if @event.price == 0
      @event = event_subscribe 
      redirect_to event_path
    else
      redirect_to subscribe_show_path(@event.id)
    end
  end

  def show_payement() end

  def create_payement
    @amount = @event.price
    @customer = create_customer
    charge = create_charge
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to show_payement_path(@event.id)
  end

  def create_customer
    Stripe::Customer.create(
      email: params[:stripeEmail],
      source: params[:stripeToken]
    )
  end

  def create_charge
    Stripe::Charge.create(
      customer:    @customer.id,
      amount:      @amount,
      description: 'Rails Stripe customer',
      currency:    'usd'
    )
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params_create
    @event = Event.new(params.require(:event).permit(
      :name, :date, :place, :price, :description))
    @event.creator = current_user
    @event
  end

  def event_params_update
    params.require(:event).permit(
      :name, :date, :place, :price, :description)
  end

  def event_check_current_user
    true if @event.creator == current_user
  end

  def event_check_current_user_index() end

  def event_subscribe
    Event.find(params[:id]).attendees << current_user
  end
end
