class AddIndextoOrganizations < ActiveRecord::Migration[5.1]
  def up
    add_index :organizations, :name, unique: true
  end

  def down
    remove_index :organizations, :name
  end
end
