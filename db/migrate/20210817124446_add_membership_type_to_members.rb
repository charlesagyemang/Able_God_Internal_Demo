class AddMembershipTypeToMembers < ActiveRecord::Migration[6.1]
  def change
    add_column :members, :membership_type, :string
  end
end
