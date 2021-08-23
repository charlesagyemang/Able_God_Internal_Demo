class CreateQuoteOfTheDays < ActiveRecord::Migration[6.1]
  def change
    create_table :quote_of_the_days do |t|
      t.string :title
      t.text :quote
      t.date :date_to_air
      t.string :author

      t.timestamps
    end
  end
end
