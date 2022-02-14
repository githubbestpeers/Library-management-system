class TotalBook < ApplicationRecord
  belongs_to :book_issue
  belongs_to :book
end
