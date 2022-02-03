class UserMailer < ApplicationMailer
   default from: 'from@example.com'
    layout 'mailer'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.user_create.subject
  #
  def user_create
    # @book = books.all #params[:name]
    # @user = user #params[:user_id]
    @greeting = "Hi"

    mail(
     #form: User.email,
     to: User.first.email , 
     #cc: User.pluck(:email), 
     #bcc: "secret@gmail.com", 
     subject: "New Mail"
    )
  end
end
