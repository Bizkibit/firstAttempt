class AddNameToFilters < ActiveRecord::Migration[5.1]

  def up
    add_column :filters, :name, :string
  end

  def down
    remove_column :filters, :name
  end

end
