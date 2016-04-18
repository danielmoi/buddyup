class SubgoalsController < ApplicationController
  def edit
  end

  def index
    @subgoals = Goal.all
  end

  def new
    @subgoal = Subgoal.new
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
end
