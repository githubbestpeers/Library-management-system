class Book < ApplicationRecord
  has_one_attached :image
  #has_many :total_books 
  belongs_to :user,  optional: true
  validates :name, presence: true
  validates :price, presence: true
  validates :author, presence: true
  validates :book_no, presence: true
  validates :image, presence: true     
  

  # def total_book
  #   line_book.to_a.sum(|book| book.total_book)
  # end  
end
