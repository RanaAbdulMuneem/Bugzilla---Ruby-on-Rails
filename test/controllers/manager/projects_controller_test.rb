require 'test_helper'

class Manager::ProjectsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get manager_projects_index_url
    assert_response :success
  end

  test "should get new" do
    get manager_projects_new_url
    assert_response :success
  end

  test "should get create" do
    get manager_projects_create_url
    assert_response :success
  end

  test "should get show" do
    get manager_projects_show_url
    assert_response :success
  end

  test "should get edit" do
    get manager_projects_edit_url
    assert_response :success
  end

  test "should get update" do
    get manager_projects_update_url
    assert_response :success
  end

  test "should get destroy" do
    get manager_projects_destroy_url
    assert_response :success
  end

end
