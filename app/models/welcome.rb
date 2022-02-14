class Welcome < ApplicationRecord
	belongs_to :book
	belongs_to :book_issue
end
