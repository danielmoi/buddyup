class UsersController < ApplicationController
  before_action :authorise, :only => [:index]
  require 'pry-rails'

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new

  end

  def edit
    @user = @current_user
    # @user = User.find params[:id]
  end

  def update
    user = @current_user
    user.update user_params
    redirect_to root_path
  end

  def create
    @user = User.new(user_params)
    
    if params[:file]
      req = Cloudinary::Uploader.upload params[:file]
      user.image_url = req["url"]
    end

    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end

  def destroy
    user = User.find params[:id]
    user.destroy
    redirect_to :controller => 'home', :action => 'index'
  end

  private
  def user_params
    params.require(:user).permit(:name, :country, :city, :bio, :email, :password_digest, :image_url)
  end

  def authorise
    redirect_to root_path unless @current_user.present? && @current_user.admin?
  end

end
