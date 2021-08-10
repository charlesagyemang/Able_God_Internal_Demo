class CreateDepartments < ActiveRecord::Migration[6.1]
  def change
    create_table :departments do |t|
      t.string :name, null: false
      t.date :meeting_days, null: false
      t.text :vision
      t.string :motto
      t.json :other

      t.timestamps
    end
  end
end
