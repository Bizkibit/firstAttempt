class AddAddressFieldsToOrganizations < ActiveRecord::Migration[5.1]
  def up
    add_column :organizations, :address, :string
    add_column :organizations, :longitude, :float
    add_column :organizations, :latitude, :float
  end

  def down
    remove_column :organizations, :latitude
    remove_column :organizations, :longitude
    remove_column :organizations, :address
  end
end
