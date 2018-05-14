require 'test_helper'

class PersonControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get person_search_url
    assert_response :success
  end

end
