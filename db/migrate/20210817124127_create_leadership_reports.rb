class CreateLeadershipReports < ActiveRecord::Migration[6.1]
  def change
    create_table :leadership_reports do |t|
      t.references :leader, null: false, foreign_key: true
      t.integer :how_many_minutes_prayed
      t.integer :how_many_chapters_read
      t.integer :how_many_messages_soaked
      t.integer :how_many_times_fasted_in_a_week
      t.text :current_book_you_are_reading
      t.text :summary

      t.timestamps
    end
  end
end
