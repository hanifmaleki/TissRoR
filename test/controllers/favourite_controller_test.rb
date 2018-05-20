require 'test_helper'

class FavouriteControllerTest < ActionDispatch::IntegrationTest
  test "should get add" do
    get favourite_add_url
    assert_response :success
  end

  test "should get remove" do
    get favourite_remove_url
    assert_response :success
  end

end
