class ConversationsController < ApplicationController
  before_action :load_conversations

  def index
  end

  def show
    @conversation = Conversation.find(params[:id])
    @messages = @conversation.messages.includes(:sender)
    # @message = Message.new room: @room
    # @messages = @room.room_messages..includes(:user)
  end

  private
  def load_conversations
    @conversations = Conversation.all
  end
end
