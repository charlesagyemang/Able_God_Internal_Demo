class PeriodStartAndEndToLeadershipReport < ActiveRecord::Migration[6.1]
  def change
    add_column :leadership_reports, :period_start, :date
    add_column :leadership_reports, :period_end, :date

    add_column :outreach_reports, :period_start, :date
    add_column :outreach_reports, :period_end, :date
  end
end
