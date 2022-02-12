require 'test_helper'

class QualityAssurance::ChangeRequestsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get quality_assurance_change_requests_show_url
    assert_response :success
  end

  test "should get new" do
    get quality_assurance_change_requests_new_url
    assert_response :success
  end

end
