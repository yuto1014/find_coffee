require 'test_helper'

class Users::RoomsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get users_rooms_show_url
    assert_response :success
  end

end
