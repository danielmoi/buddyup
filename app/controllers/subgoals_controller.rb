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
    @subgoal = Subgoal.create(subgoals_params)

    respond_to do |format|
      format.html
      format.json
    end

  end




  private

  # make @subgoals available to index and create
  def all_subgoals
    @subgoals = Subgoal.all
  end

  def subgoals_params
    params.require(:subgoal).permit(:title, :description, :completed, :goal_id, :created_at)
  end



end
