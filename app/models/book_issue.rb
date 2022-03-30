
class BookIssue < ApplicationRecord
 enum status: { pending: 0, failed: 1, paid: 2, paypal_executed: 3}
  enum payment_gateway: { stripe: 0, paypal: 1 }
  belongs_to :user
  belongs_to :book
 # before_save :set_total_fine
  #belongs_to :total_fine
  #belongs_to :submit_book
 # before_validation :set_total
# belongs_to :payment 


  scope :recently_created, ->  { where(created_at: 1.minutes.ago..DateTime.now) }

  def set_paid
    self.status = BookIssue.statuses[:paid]
  end
  def set_failed
    self.status = BookIssue.statuses[:failed]
  end
  def set_paypal_executed
    self.status = BookIssue.statuses[:paypal_executed]
  end




  
  # def total_fine
  #   if submit_date < total_day
  #      self.update(total_fine: 2*5)
  #   end   
  # end

  
    # private

    # def set_total_fine
    #   self[:total_fine] = total_fine
    # end  

     def paypal_url(return_url)
      values = {
        :business => 'sb-e3ua912102888@business.example.com',
        :cmd => 'book_issue',
        :upload => 1,
        :return => return_url,
      }
      
      "https://www.sandbox.paypal.com/in/signin" #+ values.to_query
    end



      #byebug

end
































# if submit_date
#   date find
#   time.now + 2
#   if submitted date is less and time .now is greater provide a maessage thankyou for submittion 
#   if submit_date is greater then total days than provide a fine message to pay expire 2*5 total fine 
#   issue book model. 
#Total_fine
