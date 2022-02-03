class Book < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  # validates :name, presence: {:message => 'field empty'}
  # validates :price, presence: {:message => 'field empty'}
  # validates :author, presence: {:message => 'field empty'}
  # validates :book_no, presence: {:message => 'field empty'}
  # validates :image, presence: {:message => 'field empty'}

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
