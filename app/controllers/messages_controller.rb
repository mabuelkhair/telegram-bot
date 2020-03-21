class MessagesController < ApplicationController
  def create
    Telegram::SenderService.call(params.dig(:conversation_id), params.dig(:message))
  end
end
