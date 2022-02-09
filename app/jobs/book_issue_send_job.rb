class BookIssueSendJob < ApplicationJob
	queue_as :default

  def perform(*args)
    book_issue = args[0]
    UserMailer.user_create(book_issue).deliver_now
  end
end