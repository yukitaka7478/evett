class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'

  has_many :evetts, dependent: :destroy
  has_many :payments, dependent: :destroy
  has_one :card, dependent: :destroy
  # has_many :followed
  # has_many :following
  # has_many :followed_user
  # has_many :following_user
  # has_many :sns
end
