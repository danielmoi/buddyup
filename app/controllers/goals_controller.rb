class GoalsController < ApplicationController
  def edit
  end

  def index
    @goals = Goal.all
  end

  def new
    @goal = Goal.new
    @categories = Category.all
  end

  def create
    @goal = Goal.new goal_params
    if @goal.save
      redirect_to user_path(@current_user.id)
      # conversation = Conversation.new
      # send POST request to '/conversations'
      goal.mailbox.conversations << ??
    else
      render 'new'
    end
  end

  def show
  end

  private
  def goal_params
    params.require(:goal).permit(:title, :description, :achieved, :acceptor_id, :initiator_id)
  end
end
