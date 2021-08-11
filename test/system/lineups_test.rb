require "application_system_test_case"

class LineupsTest < ApplicationSystemTestCase
  setup do
    @lineup = lineups(:one)
  end

  test "visiting the index" do
    visit lineups_url
    assert_selector "h1", text: "Lineups"
  end

  test "creating a Lineup" do
    visit lineups_url
    click_on "New Lineup"

    fill_in "Mc", with: @lineup.mc
    fill_in "References", with: @lineup.references
    click_on "Create Lineup"

    assert_text "Lineup was successfully created"
    click_on "Back"
  end

  test "updating a Lineup" do
    visit lineups_url
    click_on "Edit", match: :first

    fill_in "Mc", with: @lineup.mc
    fill_in "References", with: @lineup.references
    click_on "Update Lineup"

    assert_text "Lineup was successfully updated"
    click_on "Back"
  end

  test "destroying a Lineup" do
    visit lineups_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Lineup was successfully destroyed"
  end
end
