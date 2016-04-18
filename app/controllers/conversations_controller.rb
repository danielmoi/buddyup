class ConversationsController < ApplicationController
  def index
    @goal = Goal.first
    @conversations = @goal.mailbox.conversations
    # every user has a mailbox
  end

  def show
    @conversation = @current_user.mailbox.conversations.find(params[:id])
    # ^^ scoped to current user so they can only see thir messages
  end

  def new
    # This is an 'array difference'
    @recipients = User.all - [@current_user]
  end

  def create
    @recipient = User.find(params[:user_id])
    receipt = @current_user.send_message(@recipient, params[:body], params[:subject])
    redirect_to conversation_path(receipt.conversation)
  end
end
