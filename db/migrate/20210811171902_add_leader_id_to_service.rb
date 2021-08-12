class AddLeaderIdToService < ActiveRecord::Migration[6.1]
  def change
    add_reference :services, :leader, null: false, foreign_key: true
  end
end
