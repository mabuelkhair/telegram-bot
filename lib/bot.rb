require 'telegram/bot'

token = Rails.application.credentials.telegram[:bot_token]
Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    options = {bot: bot, message: message}
  end
end

