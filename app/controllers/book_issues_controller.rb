class BookIssuesController < ApplicationController
  
  def index
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
 
  def create
    @book_issue = BookIssue.new(book_issue_params)
    if @book_issue.save
       redirect_to books_path
    else
      render 'new'
    end

      #  flash[:success] = t('flash.book.success')
      # flash.now[:error] = t('flash.book.error_html')

  end

  private
    def book_issue_params
      params.require(:book_issue).permit(:issue_date, :submit_date, :book_id, :user_id)
    end 

end
