class AddCreationUrlToMembers < ActiveRecord::Migration[6.1]
  def change
    add_column :members, :creation_url, :string
  end
end
