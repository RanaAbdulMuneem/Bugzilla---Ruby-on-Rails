require 'test_helper'

class Developer::ProjectsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get developer_projects_index_url
    assert_response :success
  end

  test "should get show" do
    get developer_projects_show_url
    assert_response :success
  end

end
