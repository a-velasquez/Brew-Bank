class User < ApplicationRecord
  has_secure_password 

  has_many :reviews, dependent: :destroy  
  has_many :reviewed_beers, through: :reviews, source: :beer  

  has_many :beers

  validates :username, uniqueness: true 
  validates :email, uniqueness: true 

  # method to login user using omniauth
  def self.create_from_omniauth(auth)
    User.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u|
      u.username = auth['info']['name']
      u.email = auth['info']['email']
      u.password = SecureRandom.hex(16)
    end
  end
end