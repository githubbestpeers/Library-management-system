require 'test_helper'

class WepayControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get wepay_index_url
    assert_response :success
  end

end
