class BookIssue < ApplicationRecord
  belongs_to :user
  belongs_to :book
 # belongs_to :total_books
end
