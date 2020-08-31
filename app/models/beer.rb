class Beer < ApplicationRecord
  belongs_to :category
  belongs_to :user 
  
  has_many :reviews
  has_many :users, through: :reviews, dependent: :destroy  

  validates :name, :brewer, :alcohol, :description, presence: true
  validates :name, uniqueness: { message: "has already been added.", case_sensitive: false } 

  scope :alphabetical, -> { order('name ASC') }
  
  def category_attributes=(attr)     
    if !attr[:name].blank?
      self.category = Category.find_or_create_by(name: attr[:name])
    end
  end

  def name_and_brewer #displays beer brewer and beer name in collection_select dropdown
    "#{brewer} - #{name}"
  end
end
