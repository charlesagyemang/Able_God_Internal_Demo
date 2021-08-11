class CreateServices < ActiveRecord::Migration[6.1]
  def change
    create_table :services do |t|
      t.string :type
      t.date :date
      t.integer :male_attendance
      t.integer :female_attendance
      t.integer :number_of_new_comers
      t.integer :offertory_amount
      t.integer :tithe_amount
      t.datetime :starting_time
      t.datetime :closing_time

      t.timestamps
    end
  end
end
