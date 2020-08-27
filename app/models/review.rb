class Review < ApplicationRecord
  belongs_to :user
  belongs_to :beer

  validates :title, :rating, :content, presence: true
  validates :rating, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than: 6 } #allows only numbers from 1 - 5 for ratings
  validates :beer, uniqueness: { scope: :user, message: "Has Already Been Reviewed By You." } #does not allow duplicates of reviews

  scope :order_by_rating, -> { joins(:beer).group(:id).order('avg(rating) desc') }

  def posted 
    self.updated_at.localtime.strftime("%I:%M %p on %m/%d/%Y")
  end
end
  