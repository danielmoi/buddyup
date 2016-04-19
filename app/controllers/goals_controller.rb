class GoalsController < ApplicationController
  def edit
  end

  def index
    @goals = Goal.where(:acceptor_id => nil) - Goal.where(:initiator_id => @current_user.id) - Goal.where(:initiator_id => nil)
  end

  def new
    @goal = Goal.new
    @categories = Category.all
  end

  def create
    @goal = Goal.new goal_params
    @goal.initiator = @current_user
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
    @goal = Goal.find params[:id]
    @goal.acceptor = @current_user # not <<

    @goal.save
    redirect_to goal_path

  end

  private
  def goal_params
    params.require(:goal).permit(:title, :description, :achieved, :acceptor_id, :initiator_id, :amount, category_ids: [])
    # ^^ category_ids: [] is equiv to :category_ids => []
  end
end
