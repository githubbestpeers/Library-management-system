# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/user_create
  def user_create
    user = User.new(user_id: user.id,  message: "Book Issued mail")
    UserMailer.with(user: user).user_create
  end

  # def submit_book
  #   user = User.new(user_id: user_id, message: "Book Submit mail")
  #   UserMailer.with(user: user).submit_book
  # end  
end
