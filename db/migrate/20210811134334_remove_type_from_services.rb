class RemoveTypeFromServices < ActiveRecord::Migration[6.1]
  def change
    remove_column :services, :type, :string
    add_column :services, :service_type, :string
  end
end
