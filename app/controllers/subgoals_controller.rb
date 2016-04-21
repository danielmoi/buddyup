# == Schema Information
#
# Table name: subgoals
#
#  id          :integer          not null, primary key
#  title       :string
#  description :string
#  completed   :boolean          default(FALSE)
#  goal_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class SubgoalsController < ApplicationController

  before_action :all_subgoals, only: [:index, :create]

  # allows us to render both html and js responses with ALL our controller actions (index.html, index.js(on)) – this is the format.html / format.js version for all actions


  def index
    # we have @subgoals through our before_action
    respond_to do |format|
      format.html
      format.json
    end
  end

  def new
    @subgoal = Subgoal.new

    respond_to do |format|
      format.html
      format.js { render :new }
    end

  end

  def create
    @goal = Goal.find params[:goal_id]
    @subgoal = Subgoal.new subgoal_params

    if @subgoal.save
      @goal.subgoals << @subgoal
      # by default, Rails expects to ouput a template to the view; since we just want to update data, we stop that default behaviour by :layout => false
      render :magic, :layout => false
    else
      render :json => {:status => 'borked'}
    end

  end

  def update
    subgoal = Subgoal.find params[:id]
    subgoal.update subgoal_params
    render :nothing => true
  end

  def destroy
    subgoal = Subgoal.find params[:id]
    subgoal.destroy
    render :nothing => true
  end

  def from_button
    @goal = Goal.find params[:goal_id]
    @subgoals = @goal.subgoals

    respond_to do |format|
      format.js
    end
  end




  private

  # make @subgoals available to index and create
  def all_subgoals
    @subgoals = Subgoal.all
  end

  def subgoal_params
    params.require(:subgoal).permit(:title, :description, :completed, :goal_id, :created_at)
  end



end
