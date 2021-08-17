class CreateOutreachReports < ActiveRecord::Migration[6.1]
  def change
    create_table :outreach_reports do |t|
      t.integer :number_of_people_visited
      t.integer :number_of_people_preached_to
      t.integer :number_of_people_prayed_for
      t.integer :number_of_days_fasted
      t.text :week_summary
      t.references :leader, null: false, foreign_key: true

      t.timestamps
    end
  end
end
