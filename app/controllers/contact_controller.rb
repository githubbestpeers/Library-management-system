class ContactController < ApplicationController
  def index
     @contacts = Contact.all
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      redirect_to @contact
    else
      render 'new'
    end
  end

  def contact_params
    params.require(:contact).permit(:name, :email, :query)
  end
end
