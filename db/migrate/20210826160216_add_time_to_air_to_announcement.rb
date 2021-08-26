class AddTimeToAirToAnnouncement < ActiveRecord::Migration[6.1]
  def change
    add_column :announcements, :time_to_air, :datetime
  end
end
