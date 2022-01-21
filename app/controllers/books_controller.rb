class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = Book.all
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

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def books_params
    params.require(:book).permit(:name, :price, :author, :book_no)
  end
end
