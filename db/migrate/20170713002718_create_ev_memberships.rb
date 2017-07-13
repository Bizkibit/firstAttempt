class CreateEvMemberships < ActiveRecord::Migration[5.1]
  def up
    create_table :ev_memberships do |t|
      t.references :user, foreign_key: true, index: true
      t.references :event, foreign_key: true, index: true

      t.timestamps
    end
  end

  def down
    drop_table :ev_memberships
  end
  
end
