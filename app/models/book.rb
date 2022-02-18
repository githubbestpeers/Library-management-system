class Book < ApplicationRecord
  
  has_one_attached :image
  belongs_to :user,  optional: true
  validates :name, presence: true
  validates :price, presence: true
  validates :author, presence: true
  validates :book_no, presence: true
  validates :image, presence: true 
  belongs_to :book_issue
end