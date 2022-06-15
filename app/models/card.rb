class Card < ApplicationRecord
  attr_accessor :card_token

  validates :card_token, presence: true
  belongs_to :user
end
