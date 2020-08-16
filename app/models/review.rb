class Review < ApplicationRecord
  belongs_to :user
  belongs_to :beer

  validates :title, :content, presence: true
end
