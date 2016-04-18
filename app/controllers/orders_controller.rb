class OrdersController < ApplicationController
  def new
  end

  def create
    # Amount in cents
    @amount = 5000

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    order = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'BuddyUp customer',
      :currency    => 'aud'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_order_path
  end
end
