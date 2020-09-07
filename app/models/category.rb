class Category < ApplicationRecord
  has_many :beers
  
  validates :name, presence: true 

  scope :alphabetical, -> { order('name ASC') }
end
