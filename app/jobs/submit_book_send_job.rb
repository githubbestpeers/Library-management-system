class SubmitBookSendJob < ApplicationJob
	queue_as :default

  def perform(*args)
    book_submit = args[0]
    #UserMailer.user_create(book_issue).deliver_now
    UserMailer.submit_book.deliver_now
  end
end