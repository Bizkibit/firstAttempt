class CreateFilters < ActiveRecord::Migration[5.1]
  def up
    create_table :filters do |t|
      t.string :address
      t.float :longitude
      t.float :latitude
      t.integer :radius

      t.timestamps
    end
  end

  def down
    drop_table :filters
  end
end
