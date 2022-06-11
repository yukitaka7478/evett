class Evett < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :text
    validates :price, numericality: { greater_than: 299, less_than: 10_000_000 }
  end

  belongs_to :user
  has_many :payments, dependent: :destroy
end
