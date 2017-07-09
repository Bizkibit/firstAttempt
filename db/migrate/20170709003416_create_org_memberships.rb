class CreateOrgMemberships < ActiveRecord::Migration[5.1]
  def up
    create_table :org_memberships do |t|
      t.references :user, foreign_key: true
      t.references :organization, foreign_key: true
      t.string :aasm_state

      t.timestamps
    end
  end

  def down
    drop_table :org_memberships
  end

end
