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
      @response = bot.api.send_message(chat_id: chat_id, text: message)
      # Todo: handle exceptions in message sending
    end
    @response
  end

end
