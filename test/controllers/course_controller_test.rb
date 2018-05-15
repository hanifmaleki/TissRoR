require 'test_helper'

class CourseControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get course_search_url
    assert_response :success
  end

  test "should get list" do
    get course_list_url
    assert_response :success
  end

  test "should get detail" do
    get course_detail_url
    assert_response :success
  end

end
