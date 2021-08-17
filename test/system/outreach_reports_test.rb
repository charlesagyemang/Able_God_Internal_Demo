require "application_system_test_case"

class OutreachReportsTest < ApplicationSystemTestCase
  setup do
    @outreach_report = outreach_reports(:one)
  end

  test "visiting the index" do
    visit outreach_reports_url
    assert_selector "h1", text: "Outreach Reports"
  end

  test "creating a Outreach report" do
    visit outreach_reports_url
    click_on "New Outreach Report"

    fill_in "Number of days fasted", with: @outreach_report.number_of_days_fasted
    fill_in "Number of people prayed for", with: @outreach_report.number_of_people_prayed_for
    fill_in "Number of people preached to", with: @outreach_report.number_of_people_preached_to
    fill_in "Number of people visited", with: @outreach_report.number_of_people_visited
    fill_in "Week summary", with: @outreach_report.week_summary
    click_on "Create Outreach report"

    assert_text "Outreach report was successfully created"
    click_on "Back"
  end

  test "updating a Outreach report" do
    visit outreach_reports_url
    click_on "Edit", match: :first

    fill_in "Number of days fasted", with: @outreach_report.number_of_days_fasted
    fill_in "Number of people prayed for", with: @outreach_report.number_of_people_prayed_for
    fill_in "Number of people preached to", with: @outreach_report.number_of_people_preached_to
    fill_in "Number of people visited", with: @outreach_report.number_of_people_visited
    fill_in "Week summary", with: @outreach_report.week_summary
    click_on "Update Outreach report"

    assert_text "Outreach report was successfully updated"
    click_on "Back"
  end

  test "destroying a Outreach report" do
    visit outreach_reports_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Outreach report was successfully destroyed"
  end
end
