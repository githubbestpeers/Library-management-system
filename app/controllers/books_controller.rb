class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = Book.paginate(:page => params[:page], :per_page => 12)
    #@book_issues = BookIssue.where(book_id: params[:book_id])
  end  

  def search
    if params[:search].blank?
      redirect_to(books_path, alert: "Empty field!") and return
    else
     keyword = params[:search]
     @books = Book.where("lower(name) LIKE ?", "%#{keyword}%")
   end
 end 


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
    @book = Book.find(params[:id])
    begin
      @book.destroy!
    rescue
      Book.find(params[:id]).present? ? @book = false : @book = true
    #delete successful action here if @deleted == true
  end
  redirect_to books_path
  end

  def book_total
    @book = Book.find(params[:id])
    @book.update(total_day-1)
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
    params.require(:books).permit(:name, :price, :author, :book_no, :description, :image, :search, :Total, :total, :bookcollection)
  end
  end








































  # def index
  #     # @book_issues = BookIssue.all.where(user_id:current_user.id)
  #     #  @books.each do|book|
  #     #   @book_issue = BookIssue.find_by(book_id: book.id)
  #     #   #@users = @book_issue.users
  #     #  @user_id = @book_issue.user_id
  #     #   @user = User.find_by(@user_id)
  #     # end

  # end
