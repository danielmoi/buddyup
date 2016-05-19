# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :text
#  email           :text
#  image_url       :string
#  password_digest :string
#  bio             :text
#  country         :string
#  city            :string
#  admin           :boolean          default(FALSE)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class UsersController < ApplicationController
  before_action :authorise, :only => [:index]

  def index
    @users = User.all
  end

  def show
    @user = @current_user #User.find params[:id]
    @goals = @user.goals_initiated << @user.goals_accepted
  end

  def new
    @user = User.new

  end

  def edit
    @user = @current_user #User.find(params[:id])
    # @user = User.find params[:id]
  end

  def update
    @user = @current_user
    if @user.update user_params
      if user_params[:image_url]
        req = Cloudinary::Uploader.upload user_params[:image_url]
        @user.image_url = req["url"]
      end

      @user.save
      redirect_to user_path(@user)
    else
      # redirect_to user_path(@user)
      render 'edit'
    end
  end

  def create
    @user = User.new(user_params_create)

    if user_params[:image_url]
      req = Cloudinary::Uploader.upload user_params[:image_url]
      @user.image_url = req["url"]
    end
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      puts @user.errors
      render 'new'
    end
  end

  def destroy
    user = User.find params[:id]
    user.destroy
    redirect_to :controller => 'home', :action => 'index'
  end

  private
  def user_params_create
    params.require(:user)
          .permit(:name, :email, :country, :city, :bio, :image_url, :password, :password_confirmation)
  end

  def user_params
    params.require(:user).permit(:name, :country, :city, :bio, :email, :password, :password_confirmation, :image_url)
  end

  def authorise
    redirect_to root_path unless @current_user.present? && @current_user.admin?
  end

end
