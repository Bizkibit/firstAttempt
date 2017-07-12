class AddAdditionalToEvents < ActiveRecord::Migration[5.1]

  def up
    add_column :organizations, :additional, :text
  end

  def down
    remove_column :organizations, :additional
  end

end
