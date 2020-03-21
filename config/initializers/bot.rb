require 'telegram/bot'
unless Rails.env.test?
  if ActiveRecord::Base.connection.table_exists? Sender.table_name
    token = Rails.application.credentials.telegram[:bot_token]
    Telegram::Bot::Client.run(token) do |bot|
      response = bot.api.getMe()
      sender = Sender.find_or_create_by(id: response["result"]["id"],
        first_name: response["result"]["first_name"])
      BOT_ID = sender.id
    end
  end
end
