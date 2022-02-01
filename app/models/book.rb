class Book < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  # def self.search(search)
  #   if search
  #     book = Book.find_by(name: search)
  #     if book
  #       self.where(book_id: book_id)
  #     else 
  #       Book.all
  #     end 
  #   else 
  #     Book.all
  #   end  
  # end      
end
