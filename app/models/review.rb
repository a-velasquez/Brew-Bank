class Review < ApplicationRecord
  belongs_to :user
  belongs_to :beer

  validates :title, :rating, :content, presence: true
  validates :rating, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than: 6} #allows only numbers from 1 - 5 for ratings
  validates :beer, uniqueness: {scope: :user} #does not allow duplicates of beers in reviews
end
  