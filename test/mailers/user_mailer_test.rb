require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "user_create" do
    mail = UserMailer.user_create
    assert_equal "User create", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
