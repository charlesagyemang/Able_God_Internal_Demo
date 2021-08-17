require "test_helper"

class LeadershipReportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @leadership_report = leadership_reports(:one)
  end

  test "should get index" do
    get leadership_reports_url
    assert_response :success
  end

  test "should get new" do
    get new_leadership_report_url
    assert_response :success
  end

  test "should create leadership_report" do
    assert_difference('LeadershipReport.count') do
      post leadership_reports_url, params: { leadership_report: { current_book_you_are_reading: @leadership_report.current_book_you_are_reading, how_many_chapters_read: @leadership_report.how_many_chapters_read, how_many_messages_soaked: @leadership_report.how_many_messages_soaked, how_many_minutes_prayed: @leadership_report.how_many_minutes_prayed, how_many_times_fasted_in_a_week: @leadership_report.how_many_times_fasted_in_a_week, references: @leadership_report.references, summary: @leadership_report.summary } }
    end

    assert_redirected_to leadership_report_url(LeadershipReport.last)
  end

  test "should show leadership_report" do
    get leadership_report_url(@leadership_report)
    assert_response :success
  end

  test "should get edit" do
    get edit_leadership_report_url(@leadership_report)
    assert_response :success
  end

  test "should update leadership_report" do
    patch leadership_report_url(@leadership_report), params: { leadership_report: { current_book_you_are_reading: @leadership_report.current_book_you_are_reading, how_many_chapters_read: @leadership_report.how_many_chapters_read, how_many_messages_soaked: @leadership_report.how_many_messages_soaked, how_many_minutes_prayed: @leadership_report.how_many_minutes_prayed, how_many_times_fasted_in_a_week: @leadership_report.how_many_times_fasted_in_a_week, references: @leadership_report.references, summary: @leadership_report.summary } }
    assert_redirected_to leadership_report_url(@leadership_report)
  end

  test "should destroy leadership_report" do
    assert_difference('LeadershipReport.count', -1) do
      delete leadership_report_url(@leadership_report)
    end

    assert_redirected_to leadership_reports_url
  end
end
