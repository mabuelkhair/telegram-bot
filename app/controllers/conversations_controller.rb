class ConversationsController < ApplicationController
  before_action :load_conversations

  def index
  end

  def show
    @conversation = Conversation.find(params.dig(:id))
    @message = Message.new conversation: @conversation
    @messages = @conversation.messages.includes(:sender)
  end

  private
  def load_conversations
    @conversations = Conversation.all
  end
end
