require 'test_helper'

class SubmitBookControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get submit_book_index_url
    assert_response :success
  end

end
