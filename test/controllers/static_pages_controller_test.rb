require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get login" do
    get static_pages_login_url
    assert_response :success
  end

  test "should get people" do
    get static_pages_people_url
    assert_response :success
  end

  test "should get theses" do
    get static_pages_theses_url
    assert_response :success
  end

  test "should get projects" do
    get static_pages_projects_url
    assert_response :success
  end

  test "should get courses" do
    get static_pages_courses_url
    assert_response :success
  end

end
