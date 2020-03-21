class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :sender

  default_scope { order(:id) }
end
