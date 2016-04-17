class OrdersController < ApplicationController
  def new
  end

  def create
    # Amount in cents
    @amount =

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    order = Stripe::Order.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'BuddyUp customer',
      :currency    => 'usd'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
