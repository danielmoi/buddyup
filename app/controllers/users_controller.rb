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

    if user.update user_params
      if user_params[:image_url]
        req = Cloudinary::Uploader.upload user_params[:image_url]
        user.image_url = req["url"]
      end
      user.save
      redirect_to user_path
    else
      render 'edit'
    end
  end

  def create
    @user = User.new(user_params)
    if user_params[:image_url]
        # raise
      req = Cloudinary::Uploader.upload user_params[:image_url]
      @user.image_url = req["url"]
    end

    if @user.save
      redirect_to user_path
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
