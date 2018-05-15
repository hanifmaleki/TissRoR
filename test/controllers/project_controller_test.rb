require 'test_helper'

class ProjectControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get project_search_url
    assert_response :success
  end

  test "should get list" do
    get project_list_url
    assert_response :success
  end

  test "should get detail" do
    get project_detail_url
    assert_response :success
  end

end
