class User < ApplicationRecord
  # Include default devise modules.
  extend Devise::Models # added this line to extend devise model
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  #  :confirmable, :omniauthable
  include DeviseTokenAuth::Concerns::User
  # Validations
  validates :username, presence: true, uniqueness: true
  validates :name, presence: true

  # Associations
  has_one_attached :avatar
  has_many :tweets, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_tweets, through: :likes, source: :tweet

  enum role: { member: 0, admin: 1 }

  # def self.from_omniauth(auth)
  #   image = Down.download(auth.info.image)

  #   where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
  #     user.provider = auth.provider
  #     user.username = auth.info.nickname
  #     user.name = auth.info.name
  #     user.avatar.attach(io: image, filename: "image.jpg")
  #     user.uid = auth.uid
  #     user.email = auth.info.email
  #     user.password = Devise.friendly_token[0, 20]
  #   end
  # end
end
