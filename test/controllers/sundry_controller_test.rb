require "test_helper"

class SundryControllerTest < ActionDispatch::IntegrationTest
  test "should get add_new_member" do
    get sundry_add_new_member_url
    assert_response :success
  end
end
