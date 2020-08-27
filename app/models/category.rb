class Category < ApplicationRecord
  has_many :beers 

  scope :alphabetical, -> { order('name ASC') }
end
