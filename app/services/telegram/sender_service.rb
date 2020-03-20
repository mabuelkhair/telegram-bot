require 'telegram/bot'

class Telegram::SenderService < ApplicationService
  attr_reader :message, :chat_id
  
  def initialize(chat_id, message)
    @chat_id = chat_id
    @message = message
  end

  def call
    token = Rails.application.credentials.telegram[:bot_token]
    Telegram::Bot::Client.run(token) do |bot|
      response = bot.api.send_message(chat_id: chat_id, text: message)
      # Todo: handle exceptions in message sending
      puts "#{Message.create(id: response["result"]["message_id"],
        sender_id: response["result"]["from"]["id"],
        conversation_id: chat_id, content: message).errors.inspect}"
    end
  end

end
