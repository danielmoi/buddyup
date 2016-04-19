class GoalsController < ApplicationController
  def edit
  end

  def index
    @goals = Goal.where(:acceptor_id => nil)
  end

  def new
    @goal = Goal.new
    @categories = Category.all
  end

  def create
    @goal = Goal.new goal_params
    if @goal.save
      @amount = params[:amount]
      redirect_to new_goal_order_path(@goal)
    else
      render 'new'
    end
  end

  def show
    @goal = Goal.find params[:id]


    @messages = @goal.messages
  end

  def buddyup

  end

  private
  def goal_params
    params.require(:goal).permit(:title, :description, :achieved, :acceptor_id, :initiator_id, :amount)
  end
end
