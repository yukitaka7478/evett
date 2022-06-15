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
  has_many :followed, class_name: 'Friend', foreign_key: 'followed_id', dependent: :destroy
  has_many :following, class_name: 'Friend', foreign_key: 'following_id', dependent: :destroy
  has_many :followed_user, through: :following, source: :followed
  has_many :following_user, through: :followed, source: :following

  # ユーザーをフォローする
  def follow(user_id)
    following.create(followed_id: user_id)
  end

  # ユーザーのフォローを外す
  def unfollow(user_id)
    following.find_by(followed_id: user_id).destroy
  end

  # フォローしていればtrueを返す
  def following?(user)
    followed_user.include?(user)
  end

  # has_many :sns
end
