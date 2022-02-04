class Book < ApplicationRecord
  has_one_attached :image
  #belongs_to :user 
  validates :name, presence: true
  validates :price, presence: true
  validates :author, presence: true
  validates :book_no, presence: true
  validates :image, presence: true     


  # def total_book
  #   line_book.to_a.sum(|book| book.total_book)
  # end  
end
