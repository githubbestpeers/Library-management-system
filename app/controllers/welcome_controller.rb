class WelcomeController < ApplicationController
  def index 
    @welcomes = Welcome.all
  end

  def new
    @welcome = Welcome.new
  end

  def contact_us
     @welcome = Welcome.new(params[:id])
   

      #@book_issue = BookIssue.new(book_issue_params)
    # if @welcome.save
    #   BookIssueSendJob.perform_later @book_issue
    #   flash[:success] = "thanks for issued book"
    #   redirect_to books_path
    # else
    #   flash.now[:error] = "You got an issue"
    #   #render :new
    # end
  end  
 
def create
  @welcome = Welcome.new(params[:contact])
 
  if @welcome.save
    redirect_to @welcome
  else
    render 'new'
  end
end
   def welcome_params
    params.require(:welcome).permit(:name, :email, :query)
  end

end
