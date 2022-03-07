class TotalBook < ApplicationRecord
  belongs_to :book_issue
  belongs_to :book
 # belongs_to :submit_book
end
