require 'test_helper'

class BookIssueControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get book_issue_index_url
    assert_response :success
  end

end
