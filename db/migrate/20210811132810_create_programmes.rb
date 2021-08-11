class CreateProgrammes < ActiveRecord::Migration[6.1]
  def change
    create_table :programmes do |t|
      t.references :lineup, null: false, foreign_key: true
      t.string :name
      t.string :facilitator
      t.string :time_allocation_in_minutes

      t.timestamps
    end
  end
end
