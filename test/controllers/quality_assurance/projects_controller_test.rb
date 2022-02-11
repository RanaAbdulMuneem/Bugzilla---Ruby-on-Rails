require 'test_helper'

class QualityAssurance::ProjectsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get quality_assurance_projects_index_url
    assert_response :success
  end

  test "should get show" do
    get quality_assurance_projects_show_url
    assert_response :success
  end

end
