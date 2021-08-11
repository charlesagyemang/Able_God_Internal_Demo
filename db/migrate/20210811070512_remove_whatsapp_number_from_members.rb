class RemoveWhatsappNumberFromMembers < ActiveRecord::Migration[6.1]
  def change
    remove_column :members, :whatsapp_number, :string
    add_column :members, :whatsapp, :string
  end
end
