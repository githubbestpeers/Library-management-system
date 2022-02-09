class BookIssuesController < ApplicationController

  def index 
    
  @available_book = Book.count-BookIssue.count
     puts '@available_book'
    if current_user.role == "admin"
      @book_issues = BookIssue.all
    else
      @book_issues = BookIssue.all.where(user_id:current_user.id)
    end
  end

  def show
    @book_issue = BookIssue.find(params[:id])
  end  
  
  def new
    @book = Book.new
    @book = Book.find(params[:book_id])
    @book_issue = BookIssue.new
  end

  def edit
    @book_issue = BookIssue.find
  end  
 


  def total_book_issue

  @available_book = Book.count-book_issue.count

  
  end  
  def create
   # @total_book = BookIssue.new(book_issue_params)
   #  if @total_book.save
   #      flash[:notice] = @total_book.error.full_messages.to_sentence
   #  end 
       # redirect_to @total_book.book

   #@available_book = Book.count-book_issue.count
   #@count_of_BookIssue = BookIssue.count

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


  private
    def book_issue_params
      params.require(:book_issue).permit(:issue_date, :submit_date, :book_id, :user_id) 
    end 
end    