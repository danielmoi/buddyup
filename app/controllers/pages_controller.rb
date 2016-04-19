class PagesController < ApplicationController
  def home
  end

  def new
  end

  def create
    user = User.find_by email: params[:email]
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      # log in
      redirect_to root_path
    else
      flash[:error] = 'Oops'
      redirect_to login_path
    end
  end

  # ^^ checks if password matches and returns object
  # session will be persistent
  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
