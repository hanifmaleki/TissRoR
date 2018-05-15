require 'test_helper'

class ThesisControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get thesis_search_url
    assert_response :success
  end

  test "should get list" do
    get thesis_list_url
    assert_response :success
  end

  test "should get detail" do
    get thesis_detail_url
    assert_response :success
  end

end
