class Book < ApplicationRecord
  
  has_one_attached :image
  belongs_to :user,  optional: true
  validates :name, presence: true
  validates :price, presence: true
  validates :author, presence: true
  validates :book_no, presence: true
  validates :image, presence: true 
  has_many :book_issues, dependent: :destroy

  #create_index 'books#index', :self
  def book_total
    self.update.to_s(Total-1)
  end  
end