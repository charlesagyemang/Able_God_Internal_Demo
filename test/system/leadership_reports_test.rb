require "application_system_test_case"

class LeadershipReportsTest < ApplicationSystemTestCase
  setup do
    @leadership_report = leadership_reports(:one)
  end

  test "visiting the index" do
    visit leadership_reports_url
    assert_selector "h1", text: "Leadership Reports"
  end

  test "creating a Leadership report" do
    visit leadership_reports_url
    click_on "New Leadership Report"

    fill_in "Current book you are reading", with: @leadership_report.current_book_you_are_reading
    fill_in "How many chapters read", with: @leadership_report.how_many_chapters_read
    fill_in "How many messages soaked", with: @leadership_report.how_many_messages_soaked
    fill_in "How many minutes prayed", with: @leadership_report.how_many_minutes_prayed
    fill_in "How many times fasted in a week", with: @leadership_report.how_many_times_fasted_in_a_week
    fill_in "References", with: @leadership_report.references
    fill_in "Summary", with: @leadership_report.summary
    click_on "Create Leadership report"

    assert_text "Leadership report was successfully created"
    click_on "Back"
  end

  test "updating a Leadership report" do
    visit leadership_reports_url
    click_on "Edit", match: :first

    fill_in "Current book you are reading", with: @leadership_report.current_book_you_are_reading
    fill_in "How many chapters read", with: @leadership_report.how_many_chapters_read
    fill_in "How many messages soaked", with: @leadership_report.how_many_messages_soaked
    fill_in "How many minutes prayed", with: @leadership_report.how_many_minutes_prayed
    fill_in "How many times fasted in a week", with: @leadership_report.how_many_times_fasted_in_a_week
    fill_in "References", with: @leadership_report.references
    fill_in "Summary", with: @leadership_report.summary
    click_on "Update Leadership report"

    assert_text "Leadership report was successfully updated"
    click_on "Back"
  end

  test "destroying a Leadership report" do
    visit leadership_reports_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Leadership report was successfully destroyed"
  end
end
