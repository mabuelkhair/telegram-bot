class Sender < ApplicationRecord
  has_many :Messages
  
  def full_name
    "#{first_name} #{last_name}"
  end
end
