class CategoriesController < ApplicationController
  def edit
  end

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
    @categories = Category.all
  end

  def create
    @category = Category.new category_params
    if @category.save
      @category_ids = params[:category_ids]
      redirect_to categories_path(@category)
  else
    render 'new'
  end
  end

  def show
    @category = Category.find params[:category_ids]
    @goal = Goal.all
  end

  private
  def category_params
    params.require(:category).permit(:id, :title, :category_ids)
  end
end
