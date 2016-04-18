class GoalsController < ApplicationController
  def edit
  end

  def index
    @goals = Goal.all
  end

  def new
  end

  def show
  end
end
