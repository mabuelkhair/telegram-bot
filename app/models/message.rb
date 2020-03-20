class Message < ApplicationRecord
  belongs_to :Conversation
  belongs_to :sender
end
