class AddUrlCreationToMembers < ActiveRecord::Migration[6.1]
  def change
    add_column :members, :url_creation, :string
  end
end
