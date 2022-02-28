class WelcomeController < ApplicationController
  def index 
    @welcomes = Welcome.all
  end

  def show
    @welcome = Welcome.find(params[:id])
  end  

  def new
    @welcome = Welcome.new
  end

  def create
    @welcome = Welcome.new(welcome_params)

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
