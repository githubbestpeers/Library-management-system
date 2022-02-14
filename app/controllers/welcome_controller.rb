class WelcomeController < ApplicationController
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



def new
  @welcome = Welcome.new
end
 
def create
  @welcome = Welcome.new(article_params)
 
  if @welcome.save
    redirect_to @welcome
  else
    render 'new'
  end
end
   

  # def new
  #   @welcome = Welcome.new
  # end

  # def create
  #   @welcome = Welcome.new(params[:contact])
  #   #@welcome.request = request
   
  # end

  #  def welcome_params
  #   params.require(:welcome).permit(:name, :email, :query)
  # end

end
