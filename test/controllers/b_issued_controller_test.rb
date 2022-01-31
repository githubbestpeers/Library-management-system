require 'test_helper'

class BIssuedControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get b_issued_index_url
    assert_response :success
  end

end
