class AddPicturesToOrganizations < ActiveRecord::Migration[5.1]
  def up
    add_column :organizations, :pictures, :json
  end

  def down
    remove_column :organizations, :pictures
  end
  
end
