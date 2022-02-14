class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    #@available_book = Book.count-BookIssue.count
    @books = Book.paginate(:page => params[:page], :per_page => 12)
    
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
    params.require(:book).permit(:name, :price, :author, :book_no, :description, :image, :Total)
  end
end
