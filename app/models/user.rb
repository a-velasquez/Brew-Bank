class User < ApplicationRecord
  has_secure_password 

  has_many :reviews 
  has_many :reviewed_beers, through: :reviews, source: :beer  

  has_many :beers

  validates :username, uniqueness: true
  validates :username, presence: true, allow_nil: true 
  validates :email, uniqueness: true
  validates :email, presence: true, allow_nil: true 

  def self.create_from_omniauth(auth)
    User.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u|
      u.username = auth['info']['name']
      u.email = auth['info']['email']
      u.password = SecureRandom.hex(16)
    end
  end
end