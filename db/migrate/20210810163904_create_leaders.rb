class CreateLeaders < ActiveRecord::Migration[6.1]
  def change
    create_table :leaders do |t|
      t.references :member, null: false, foreign_key: true
      t.references :department, null: false, foreign_key: true
      t.string :leader_type,  null: false
      t.json :other

      t.timestamps
    end
  end
end
