# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/user_create
  def user_create
    UserMailer.user_create
   # UserMailer.with(book: Book.first, user: user.first).user_create
  end

end
