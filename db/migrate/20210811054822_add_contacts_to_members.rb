class AddContactsToMembers < ActiveRecord::Migration[6.1]
  def change
    add_column :members, :whatsapp_number, :string
    add_column :members, :twitter_name, :string
    add_column :members, :facebook_name, :string
    add_column :members, :phone_number_two, :string
    add_column :members, :phone_number_three, :string
    remove_column :members, :age, :string
    remove_column :members, :skills, :string
    add_column :members, :phone_number_four, :string
    add_column :members, :telegram_number, :string
    add_column :members, :occupation, :string
    add_column :members, :year_joined, :string
  end
end
