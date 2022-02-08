class TotalBook < ApplicationRecord
 # validates
  belongs_to :book_issue
  belongs_to :book
end
