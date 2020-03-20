require 'telegram/bot'

token = Rails.application.credentials.telegram[:bot_token]

Telegram::Bot::Client.run(token) do |bot|
  response = bot.api.getMe()
  Sender.find_or_create_by(id: response["result"]["id"],
    first_name: response["result"]["first_name"])
  # TODO: handle old messages and conversation if new bot used

end