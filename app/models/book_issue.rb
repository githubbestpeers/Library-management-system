class BookIssue < ApplicationRecord
  belongs_to :user
  belongs_to :book
  
  #validate :day, (1..15).to_a
attr_accessor :day
validate :validate_creates_at

private
 
def convert_created_at
  begin
    self.created_at = BookIssue.new(self.day.to_i)
  rescue book_issue
  false
  end  
end

def validate_created_at
  errors.add("Created at date", "is invalid.") unless convert_created_at
end

  #validate :issue_date, :submit_date
 #  validate :submit_date_after_issue_date

 #  private

 #  def submit_date_after_issue_date
 #    return if submit_date.blank? || issue_date.blank?

 #    if submit_date < issue_date
 #      errors.add(:submit_date, "must be after the start date")
 #    end
 # end

end
