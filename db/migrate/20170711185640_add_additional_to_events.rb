class AddAdditionalToEvents < ActiveRecord::Migration[5.1]
  
  def up
    add_column :events, :additional, :text
  end

  def down
    remove_column :events, :additional
  end

end
