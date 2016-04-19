class MessagesController < ApplicationController

  def new
    @message = Message.new
    @goal = Goal.find params[:goal_id]
  end

  def index
    @goal = Goal.find params[:goal_id]
    @messages = @goal.messages
  end

  def create
    @goal = Goal.find params[:goal_id]
    @message = Message.new message_params
    if @message.save
      @goal.messages << @message
      redirect_to goal_path(params[:goal_id])
    else
      render new_goal_message_path
    end
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
