class OrdersController < ApplicationController
  def new
    @goal = Goal.find params[:goal_id]
    @amount = @goal.amount * 100
end

  def create
    # Amount in cents
    @goal = Goal.find params[:goal_id]
    @amount = @goal.amount * 100

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
    redirect_to new_goal_order_path
  end
end
