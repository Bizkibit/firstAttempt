class AddPasswordToOrganizations < ActiveRecord::Migration[5.1]
  def up
    add_column :organizations, :password_digest, :string
  end

  def down
    remove_column :organizations, :password_digest
  end

end
