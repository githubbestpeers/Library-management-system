class BookIssuesController < ApplicationController

  def index 
    # if current_user.role == "admin"
    #   @book_issues = BookIssue.paginate(:page => params[:page], :per_page => 10)
    # else
    #   @book_issues = BookIssue.where(user_id:current_user.id)
    # end
    @book_issues = BookIssue.where(book_id: params[:book_id])
  end
  
  def show
    @book_issue = BookIssue.find(params[:id])
  end  
  
  def new
    @book = Book.new
    #self.update(Total)
    @book = Book.find(params[:book_id])
    
    @book_issue = BookIssue.new  
  end

  def edit
    @book_issue = BookIssue.find
  end

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

  private

  def book_issue_params
    params.require(:book_issue).permit(:issue_date, :submit_date, :book_id, :user_id, :total_day, :total_fine)
  end 
end    