require "test_helper"

class NonMemberControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get non_member_index_url
    assert_response :success
  end
end
