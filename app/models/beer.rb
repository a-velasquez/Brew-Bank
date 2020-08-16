class Beer < ApplicationRecord
  belongs_to :category
  
  has_many :reviews
  has_many :users, through: :reviews 

  validates :name, :brewer, :alcohol, :description, presence: true

  def category_attributes=(attr)     
    if !attr[:name].blank?
      self.category = Category.find_or_create_by(name: attr[:name])
    end
  end
end
