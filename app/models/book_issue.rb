class BookIssue < ApplicationRecord
  belongs_to :user
  belongs_to :book

  def submit_date
    self.update(submit_date:created_at + total_day)
    if submit_date > total_day
      self.update("Thankyou for early submittion")
    else
      self.update(total_fine: 2*5)  
    end  
  end 


  def total_fine
    if submit_date < total_day
      self.update(total_fine: 2*5)
    end  
#  def check_submit_date
#   self.update(submit_date: created_at + total_day)
#  end

#  def calculate_fine
#  if 
#    self.update(total_fine: 2*5)
#  end
# end
  end

# if submit_date
#   date find
#   time.now + 2
#   if submitted date is less and time .now is greater provide a maessage thankyou for submittion 
#   if submit_date is greater then total days than provide a fine message to pay expire 2*5 total fine 
#   issue book model. 
#Total_fine
end