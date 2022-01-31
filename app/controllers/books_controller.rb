class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = Book.paginate(:page => params[:page], :per_page => 4)
  end
  def search
    @book = Book.where(["name LIKE ?","%#{params[:id]}%"]) 
    redirect_to book_path
  end  
  
  def show

  end

  def new
    @book = Book.new
  end

  def edit
  end

  def create
    
    @book = Book.new(books_params)
    @book.image.attach(params[:books][:image])
    if @book.save
      redirect_to @book
    else
      render 'new'
    end
  end

  def destroy
    @book.destroy
    redirect_to books_path
  end

  def update
    if @book.update(books_params)
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

  def books_params
    params.require(:books).permit(:name, :price, :author, :book_no, :description, :image, :user_id)
  end
end
