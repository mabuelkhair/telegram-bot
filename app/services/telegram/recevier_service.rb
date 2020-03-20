class Telegram::RecevierService < ApplicationService
  attr_reader :message, :chat_id
  
  def initialize(message)
    @message = message
  end

  def call
    # puts @message.inspect
    sender = create_or_update_sender
    conversation = create_or_update_conversation(sender)
    message = create_or_update_message(sender, conversation)
  end

  def create_or_update_sender
    # get sender and update name if changed (should use upsert but sqlite does not support it)
    sender = Sender.find_or_create_by(id: @message.from.id)
    if (sender.first_name != @message.from.first_name or 
        sender.last_name != @message.from.last_name)
      sender.last_name = @message.from.last_name
      sender.save
    end
    sender
  end

  def create_or_update_conversation(sender)
    conversation = Conversation.find_or_create_by(id: @message.chat.id, 
      conversation_type: @message.chat.type)
    if conversation.conversation_type != 'private' && conversation.title != @message.chat.title
      conversation.title = @message.chat.title
      conversation.save
    elsif conversation.conversation_type == 'private' && conversation.title != sender.full_name
        conversation.title = sender.full_name
        conversation.save
    end
    conversation
  end

  def create_or_update_message(sender, conversation)
    # get message and update content if changed (use upsert if not sqlite)
    message = Message.find_or_create_by(id: @message.message_id, 
      sender_id: sender.id,
      conversation_id: conversation.id
      )
    if message.content != @message.text
      message.content = @message.text
      message.save
    end
    message
  end
end
