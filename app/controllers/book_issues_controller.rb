class BookIssuesController < ApplicationController

  #before_action :set_user, only: [:index]

  def index 
      @book_issues = BookIssue.where(book_id: params[:book_id])
  end 

  def edit
      books = Book.all
      @books_purchase = books.where(stripe_p_name:nil, paypal_p_name:nil)
      @books_subscription = books - @books_purchase
  end  

  def submit
     @book_issue = nil
    #Check which type of order it is
    if book_issue_params[:payment_gateway] == "stripe"
      prepare_new_order
      BookIssues::Stripe.execute(book_issue: @book_issue, user: current_user)
    elsif book_issue_params[:payment_gateway] == "paypal"
      #PAYPAL WILL BE HANDLED HERE
    end
  ensure
    if @book_issue&.save
      if @book_issue.paid?
        # Success is rendered when order is paid and saved
        return render html: SUCCESS_MESSAGE
      elsif @book_issue.failed? && !@book_issue.error_message.blank?
        # Render error only if order failed and there is an error_message
        return render html: @book_issue.error_message
      end
    end
    render html: FAILURE_MESSAGE
  end

  def show
    @book_issue = BookIssue.find(params[:id])
  end
  
  def new
    @book = Book.new
    #self.update(Total-1)
    @book = Book.find(params[:book_id])
    @book_issue = BookIssue.new  
  end

  def submit_book
    UserMailer.submit_book.deliver_later
  end  

  def create
   # @book_issue = paypal_url(params).book_issue.all
    # @book = book_issue(params)
    # @book = paypal_url(params)
    # @book_issues.paypal_url(params)
    #@book_issue.total_fine(params[:id])
    @book_issue = BookIssue.new(book_issue_params)
    if @book_issue.save
      BookIssueSendJob.perform_later @book_issue
      flash[:success] = "thanks for issued book"
      redirect_to books_path
    else
      flash.now[:error] = "You got an issue"
      render 'new'
    end
  end
  
   def paypal_url
   @book_issue = paypal_url(return_url).book
  end


  def perticular_user
    if current_user.role == "admin"
     # @book_issue = BookIssue.all
       @book_issues = BookIssue.paginate(:page => params[:page], :per_page => 10)
    else
      @book_issues = current_user.book_issues
      # @book_issues = BookIssue.where(user_id:current_user.id)
    end
  end  

  # def gentel_remider
  #  UserMailer.gentel_remider.deliver_total_day-2
  #  BookIssue.last.total_day-2
  # end
      
def gentel_remider
  @book_issue = current_user
  if Time.now.utc == @book_issue.created_at + 24.hours && @book_issue.empty?
    UserMailer.submit_book(@book_issue).deliver
  end
end

  def set_user
    if current_user.role == "admin"
     # @book_issue = BookIssue.all
       @book_issues = BookIssue.paginate(:page => params[:page], :per_page => 10)
    else
      @book_issues = current_user.book_issues
      # @book_issues = BookIssue.where(user_id:current_user.id)
    end
  end  

  # private

  def book_issue_params
    params.require(:book_issue).permit(:user_id, :book_id, :issue_date, :submit_date, :created_at, :updated_at, :day, :date, :status, :total_day, :total_fine, :token, :charge_id, :error_message, :customer_id, :payment_gateway)#:payment_gateway, :token, :charge_id, :error_message, :customer_id, :issue_date, :submit_date, :book_id, :user_id, :total_day, :total_fine)
  end 
end    