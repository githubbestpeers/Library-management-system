class UserMailer < ApplicationMailer

  def user_create(book_issue)
    @book = Book.find(book_issue.book_id)
    @user = User.find(book_issue.user_id)

    mail(
     to: @user.email,
     subject: "you got issued book"
    )
  end
end
