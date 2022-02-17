class Book < ApplicationRecord

  #  include Elasticsearch::Model
  # include Elasticsearch::Model::Callbacks

  # index_name Rails.application.class.parent_name.underscore
  # document_type self.name.downcase

  
  has_one_attached :image
  belongs_to :user,  optional: true
  validates :name, presence: true
  validates :price, presence: true
  validates :author, presence: true
  validates :book_no, presence: true
  validates :image, presence: true 
belongs_to :book_issue
  
 # def self.search(search)
 #  if search
 #    book = Book.find_by(params[:search])
 #    if book
 #      self.where(book_id: book.id)
 #    else
 #      @books = Book.all
 #    end 
 #  else 
 #     @books = Book.all 
 #  end
 #  end    
end
