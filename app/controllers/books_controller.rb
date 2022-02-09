class BooksController < ApplicationController


  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @available_book = Book.count-BookIssue.count
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

  def show

  end

  def new
   # @book = Book.find(params[:id])
    @book = Book.new
  end

  def edit
  end

   def total_book
    @book = Book.new(book_params)
  end

  def create
    #byebug
      @book =Book.new(book_params)
     #@book.image.attach(params[:books][:image])


      if @book.save
       # UserMailer.with(user: current_user, user: @user ) .user_create.deliver_later
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
   #@book = Book.find(params[:id]) 
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

 #params.require(:books).permit(:name, :price, :author, :book_no, :description, :image, :user_id, :role, :search, :Total)
   
   params.permit(:name, :price, :author, :book_no, :description, :image, :Total)

 #new_params = params.to_h.merge()


  end
end
