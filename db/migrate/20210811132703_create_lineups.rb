class CreateLineups < ActiveRecord::Migration[6.1]
  def change
    create_table :lineups do |t|
      t.references :service, null: false, foreign_key: true
      t.text :mc

      t.timestamps
    end
  end
end
