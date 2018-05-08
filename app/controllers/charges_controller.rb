class ChargesController < ApplicationController
  def new() end

  def create
    @amount = 500
    customer = create_customer
    charge = create_charge
    Stripe.api_key = "sk_test_beAGeY6YkmddYusBnRehq5J9"
    token = params.require(:stripeToken)
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
  end

  def create_customer
    Stripe::Customer.create(
      email: params[:stripeEmail],
      source: params[:stripeToken]
    )
  end

  def create_charge
    Stripe::Charge.create(
      customer:    customer.id,
      amount:      @amount,
      description: 'Rails Stripe customer',
      currency:    'usd'
    )
  end
end
