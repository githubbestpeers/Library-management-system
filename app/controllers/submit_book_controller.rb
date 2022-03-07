class SubmitBookController < ApplicationController
  # def index 
  #   byebug
  #     @submit_books = SubmitBook.all
  # end
  
  # def new
  #   @book = Book.new
  #   #self.update(Total)
  #   @book = Book.find(params[:book_id])
    
  #   @submit_book = SubmitBook.new  
  #   #@submit_book = SubmitBook.new
  # end

  # # def edit
  # #   @book_issue = BookIssue.find
  # # end

  # def create
  #    @submit_book = SubmitBook.new
  # # byebug
  #   if @submit_book.save
  #     SubmitBookSendJob.perform_later @submit_book
  #     flash[:success] = "thanks for issued book"
  #     redirect_to books_path
  #   else
  #     flash.now[:error] = "You got an issue"
  #     render 'new'
  #   end
  # end

  # private

  # def book_issue_params
  #   params.require(:submit_book).permit(:submit_date)
  # end 
end
