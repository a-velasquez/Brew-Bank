class User < ApplicationRecord
  has_many :reviews 
  has_many :beers, through: :reviews

  has_secure_password

  validates :username, presence: true
  validates :username, uniqueness: true 
  validates :password, presence: true, length: {minimum: 6}, allow_nil: true
  validates :email, presence: true
  validates :email, :uniqueness => {:case_sensitive => false}
end
