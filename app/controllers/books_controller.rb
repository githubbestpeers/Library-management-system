class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = Book.paginate(:page => params[:page], :per_page => 4)
  
  end

  def search
    if params[:search].blank?
      redirect_to(books_path, alert: "Empty field!") and return
    else
       keyword = params[:search]
       @books = Book.where("lower(name) LIKE ?", "%#{keyword}%")
    end
  end
  # def search
  #   @books = Book.search([:id])
  #   @books = Book.find([:id]) 
  #   # @book = Book.where(["name LIKE ?","%#{params[:id]}%"]) 
  #   # redirect_to book_path
  # end  
  
  def show

  end

  def new
    @book = Book.new
  end

  def edit
  end

  def create
    
      @book = Book.new(book_params)
      @book.image.attach(params[:books][:image])
      if @book.save
        # UserMailer.with(user: current_user, user: @user ) .user_create.deliver_later
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
    if @book.update(book_params)
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
    params.require(:books).permit(:name, :price, :author, :book_no, :description, :image, :user_id, :role, :search)
  end
end
