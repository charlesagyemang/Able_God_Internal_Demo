class ChangeMeetingDaysFieldTypeOnDepartment < ActiveRecord::Migration[6.1]
  def change
    change_table :departments do |t|
      t.change :meeting_days, :string
    end
  end
end
