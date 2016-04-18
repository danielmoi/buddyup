class MessagesController < ApplicationController

  def new
    @message = Message.new
    @goal = Goal.find params[:goal_id]
  end

  def index
    @messages = Message.all
  end

  def create
    @message = Message.new(message_params)
    @goal = Goal.find params[:goal_id]
  end

  def edit
  end

  def delete
  end

  private
  def message_params
    params.require(:message).permit(:initiator_id, :acceptor_id, :subject, :content)
  end
end
