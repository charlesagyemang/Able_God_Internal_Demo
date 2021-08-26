class CreateAnnouncements < ActiveRecord::Migration[6.1]
  def change
    create_table :announcements do |t|
      t.string :title
      t.text :message
      t.date :date_to_air

      t.timestamps
    end
  end
end
