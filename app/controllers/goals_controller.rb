# == Schema Information
#
# Table name: goals
#
#  id           :integer          not null, primary key
#  title        :string
#  description  :text
#  achieved     :boolean          default(FALSE)
#  acceptor_id  :integer
#  initiator_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  amount       :integer
#

class GoalsController < ApplicationController

require "action_view"
include ActionView::Helpers::DateHelper

  def edit
    @goal = Goal.find params[:id]
    @categories = Category.all
  end

  def update
    goal = Goal.find params[:id]
    goal.update goal_params
    redirect_to goal_path
  end

  def index
    @categories = Category.all

    if @current_user.present?
      @goals = Goal.where(:acceptor_id => nil) - Goal.where(:initiator_id => @current_user.id) - Goal.where(:initiator_id => nil)
    else
      @goals = Goal.all
    end
    @goals.map! do |goal|
      #goal.this_is_the_date = goal.created_at
      goal.created_date_ago = distance_of_time_in_words_to_now(goal.created_at)
      #goal.killme = time_tag(goal.created_date)
      goal
    end

    respond_to do |format|
      format.html { }
      format.json { render json: @goals.to_json(:include => [:categories, :initiator]) }
    end
    puts(@goals.inspect)
  end



  def new
    @goal = Goal.new
    @categories = Category.all
  end

  def create
    @goal = Goal.new goal_params
    @goal.initiator = @current_user
    @error_amount = @goal[:amount]

    if @goal.save
      redirect_to new_goal_order_path(@goal)
    else
      render 'new'
    end
  end

  def show
    @goal = Goal.find params[:id]
    @subgoal = Subgoal.new
    @messages = @goal.messages
    @subgoals = @goal.subgoals

    respond_to do |format|
      format.html
      format.json{
        render :json => @goal.to_json
      }
    end

  end

  def destroy
    goal = Goal.find params[:id]

    @user = User.all

    goal.destroy
    redirect_to user_path(@current_user)

  end

  def achieved
    @goal = Goal.find params[:id]
    @goal.achieved = true
    @goal.save
    redirect_to user_path(@current_user)
  end

  def buddyup
    @goal = Goal.find params[:goal_id]
    @goal.acceptor = @current_user # not <<

    @goal.save
    redirect_to goal_path params[:goal_id]

  end

  private
  def goal_params
    params.require(:goal).permit(:title, :description, :achieved, :acceptor_id, :initiator_id, :amount, category_ids: [])
    # ^^ category_ids: [] is equiv to :category_ids => []
  end
end
