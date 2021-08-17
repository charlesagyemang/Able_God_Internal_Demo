json.extract! outreach_report, :id, :number_of_people_visited, :number_of_people_preached_to, :number_of_people_prayed_for, :number_of_days_fasted, :week_summary, :created_at, :updated_at
json.url outreach_report_url(outreach_report, format: :json)
