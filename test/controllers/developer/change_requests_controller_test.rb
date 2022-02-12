require 'test_helper'

class Developer::ChangeRequestsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get developer_change_requests_show_url
    assert_response :success
  end

end
