class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    #@available_book = Book.count-BookIssue.count
    @books = Book.paginate(:page => params[:page], :per_page => 12)
    
    # @book_issues = BookIssue.all.where(user_id:current_user.id)
    #  @books.each do|book|
    #   @book_issue = BookIssue.find_by(book_id: book.id)
    #   #@users = @book_issue.users
    #  @user_id = @book_issue.user_id
    #   @user = User.find_by(@user_id)
    # end
  end  
  def search
    if params[:search].blank?
      redirect_to(books_path, alert: "Empty field!") and return
    else
       keyword = params[:search]
       @books = Book.where("lower(name) LIKE ?", "%#{keyword}%")
    end
  end

  def user_list

    @books.each do|book|
   # byebug
    @book_issue = BookIssue.find_by(book_id: book.id)
    @user_id = @book_issue.user_id
    @user = User.find(@user_id)
    end
  end  

  # def Total_book
  #   @book = Book.all
  #   if BookIssue = 1
  #      @book.Total-BookIssue
  #   end 
  # end  

  def show
  end

  def new
    @book = Book.new
  end

  def edit
  end

  def create
    @book =Book.new(book_params)
    if @book.save
      redirect_to @book 
    else
      render :new
    end
  end

  def destroy
    @book.destroy
    redirect_to books_path
  end

  def update
    if @book.update_attributes(book_params)
      redirect_to @book
    else
      render 'edit'
    end
  end

  def issue
    @book_issue = BookIssue.find(params[:id])
  end  

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:name, :price, :author, :book_no, :description, :image, :search, :Total)
  end
end
