class BookIssuesController < ApplicationController

  def index 
    @book_issues = BookIssue.where(book_id: params[:book_id])
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

  # def submit_book
  #   #UserMailer.submit_book.deliver_later
  #       SubmitBookSendJob.perform_later @book_issue
  #  @book_issue = BookIssue.new
  # # byebug
  #   if @book_issue.save
  #     #SubmitBookSendJob.perform_later @book_issue
  #     UserMailer.user_create.deliver_now
  #     flash[:success] = "thanks for issued book"
  #     redirect_to books_path
  #   else
  #     flash.now[:error] = "You got an issue"
  #     render 'submit_book'
  #   end
  # end  

def create
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

  # def gentel_remider
  #  # BookIssue.last.total_day-2
  # # UserMailer.gentel_remider.deliver_total_day-2
  # @book_issue = BookIssue.new
  # #if @book_issue.save
  #  SubmitBookSendJob.set(wait: total_day-2).perform_later(user)
  #  flash[:success] = "submit book remider"
  #  redirect_to books_path
  # end  

  private

  def book_issue_params
    params.require(:book_issue).permit(:issue_date, :submit_date, :book_id, :user_id, :total_day, :total_fine)
  end 
end    