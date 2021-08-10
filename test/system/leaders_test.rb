require "application_system_test_case"

class LeadersTest < ApplicationSystemTestCase
  setup do
    @leader = leaders(:one)
  end

  test "visiting the index" do
    visit leaders_url
    assert_selector "h1", text: "Leaders"
  end

  test "creating a Leader" do
    visit leaders_url
    click_on "New Leader"

    fill_in "Department", with: @leader.department_id
    fill_in "Leader type", with: @leader.leader_type
    fill_in "Member", with: @leader.member_id
    click_on "Create Leader"

    assert_text "Leader was successfully created"
    click_on "Back"
  end

  test "updating a Leader" do
    visit leaders_url
    click_on "Edit", match: :first

    fill_in "Department", with: @leader.department_id
    fill_in "Leader type", with: @leader.leader_type
    fill_in "Member", with: @leader.member_id
    click_on "Update Leader"

    assert_text "Leader was successfully updated"
    click_on "Back"
  end

  test "destroying a Leader" do
    visit leaders_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Leader was successfully destroyed"
  end
end
