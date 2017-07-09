class CreateOrganizations < ActiveRecord::Migration[5.1]
  def up
    create_table :organizations do |t|
      t.string :name
      t.string :website
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :email

      t.timestamps
    end
  end

  def down
    drop_table :organizations

  end


end
