class MessagesController < ApplicationController
  before_action :validate_presence

  def create
    response = Telegram::SenderService.call(params.dig(:conversation_id), params.dig(:message))
    Message.create(id: response["result"]["message_id"],
      sender_id: response["result"]["from"]["id"],
      conversation_id: params.dig(:conversation_id), content: params.dig(:message))
  end

  private
  def validate_presence
    params.require(:conversation_id)
    params.require(:message)
  end
end
