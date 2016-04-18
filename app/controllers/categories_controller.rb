class CategoriesController < ApplicationController
  def edit
  end

  def index
    @categories = Category.all
  end

  def new
    @categories = Category.new
    @categories = Category.all
  end

  def create
    @categories = Category.new category_params
    render 'new'
  end

  def show
    @category = Category.find params[:id]
  end

  private
  def category_params
    params.require(:category).permit(:id, :title)
  end
end
