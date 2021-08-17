require "test_helper"

class OutreachReportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @outreach_report = outreach_reports(:one)
  end

  test "should get index" do
    get outreach_reports_url
    assert_response :success
  end

  test "should get new" do
    get new_outreach_report_url
    assert_response :success
  end

  test "should create outreach_report" do
    assert_difference('OutreachReport.count') do
      post outreach_reports_url, params: { outreach_report: { number_of_days_fasted: @outreach_report.number_of_days_fasted, number_of_people_prayed_for: @outreach_report.number_of_people_prayed_for, number_of_people_preached_to: @outreach_report.number_of_people_preached_to, number_of_people_visited: @outreach_report.number_of_people_visited, week_summary: @outreach_report.week_summary } }
    end

    assert_redirected_to outreach_report_url(OutreachReport.last)
  end

  test "should show outreach_report" do
    get outreach_report_url(@outreach_report)
    assert_response :success
  end

  test "should get edit" do
    get edit_outreach_report_url(@outreach_report)
    assert_response :success
  end

  test "should update outreach_report" do
    patch outreach_report_url(@outreach_report), params: { outreach_report: { number_of_days_fasted: @outreach_report.number_of_days_fasted, number_of_people_prayed_for: @outreach_report.number_of_people_prayed_for, number_of_people_preached_to: @outreach_report.number_of_people_preached_to, number_of_people_visited: @outreach_report.number_of_people_visited, week_summary: @outreach_report.week_summary } }
    assert_redirected_to outreach_report_url(@outreach_report)
  end

  test "should destroy outreach_report" do
    assert_difference('OutreachReport.count', -1) do
      delete outreach_report_url(@outreach_report)
    end

    assert_redirected_to outreach_reports_url
  end
end
