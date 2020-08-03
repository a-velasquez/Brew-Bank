class User < ApplicationRecord
  has_secure_password
  has_many :reviews 
  has_many :beers, through: :reviews
  validates :username, presence: true
  validates :username, uniqueness: true 
  validates :password, presence: true, length: {minimum: 6}, allow_nil: true
  validates :email, presence: true
  validates :email, :uniqueness => {:case_sensitive => false}

  #method to login user using omniauth

  def self.create_from_omniauth(auth)
    User.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u|
      u.username = auth['info']['first_name']
      u.email = auth['info']['email']
      u.password = SecureRandom.hex(16)
    end
  end

end
