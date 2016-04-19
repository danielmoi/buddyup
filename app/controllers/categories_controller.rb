class CategoriesController < ApplicationController
  def edit
  end

  def index
    @categories = Category.all
  end

  def new
  end

  def show
    @category = Category.find params[:id]
    @goals = @category.goals
  end
end
