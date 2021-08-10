class CreateMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :members do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.date :birthday, null: false
      t.string :phone_number, null: false
      t.integer :age, null: true
      t.boolean :primary_education, default:  false
      t.boolean :secondary_education, default:  false
      t.boolean :above_secondary, default:  false
      t.json :skills, default: {}
      t.json :other, default: {}

      t.timestamps
    end
  end
end
