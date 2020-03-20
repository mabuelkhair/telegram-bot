class Telegram::RecevierService < ApplicationService
  attr_reader :message, :chat_id
  
  def initialize(message)
    @message = message
  end

  def call
    # get sender and update name if changed (should use upsert but sqlite does not support it)
    puts @message.inspect
    sender = Sender.find_or_create_by(id: @message.from.id)
    if (sender.first_name != @message.from.first_name or 
        sender.last_name != @message.from.last_name)
      sender.first_name = @message.from.first_name 
      sender.last_name = @message.from.last_name
      sender.save
    end
    # get conversation and update title (should use upsert)
    conversation = Conversation.find_or_create_by(conversation_id: @message.chat.id, 
      conversation_type: @message.chat.type)
    if conversation.conversation_type != 'private' && conversation.title != @message.chat.title
      conversation.title = @message.chat.title
      conversation.save
    elsif conversation.conversation_type == 'private' && conversation.title != sender.full_name
        conversation.title = sender.full_name
        conversation.save
    end
  end
end
