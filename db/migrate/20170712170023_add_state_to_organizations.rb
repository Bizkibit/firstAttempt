class AddStateToOrganizations < ActiveRecord::Migration[5.1]

  def up
    add_column :organizations, :aasm_state, :string
  end

  def down
    remove_column :organizations, :aasm_state
  end

end
