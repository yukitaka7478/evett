class Payment < ApplicationRecord
  attr_accessor :token

  with_options presence: true do
    validates :pay, numericality: { greater_than: 299, less_than: 10_000_000 }
    validates :token
  end

  belongs_to :user
  belongs_to :evett
end
