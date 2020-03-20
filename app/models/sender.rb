class Sender < ApplicationRecord
  has_many :messages
  
  def full_name
    "#{first_name} #{last_name}"
  end
end
