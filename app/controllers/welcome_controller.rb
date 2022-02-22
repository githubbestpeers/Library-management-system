class WelcomeController < ApplicationController
  def index 
    @welcomes = Welcome.all
  end

  def new
    @welcome = Welcome.new
  end

  
 
def create

  #  @article = Article.new(params[:article])
 
  # @article.save
  # redirect_to @welcome
  @welcome = Welcome.new(params[:id])
 
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
