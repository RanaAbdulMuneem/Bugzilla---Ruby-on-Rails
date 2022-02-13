require 'test_helper'

class Manager::ChangeRequestsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get manager_change_requests_show_url
    assert_response :success
  end

end
