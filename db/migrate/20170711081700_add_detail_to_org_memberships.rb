class AddDetailToOrgMemberships < ActiveRecord::Migration[5.1]
  def up
    add_column :org_memberships, :detail, :text
  end

  def down
    drop_column :org_memberships, :detail
  end

end
