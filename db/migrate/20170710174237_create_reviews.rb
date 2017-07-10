class CreateReviews < ActiveRecord::Migration[5.1]
  def up
    create_table :reviews do |t|
      t.text :body
      t.integer :star
      t.references :organization, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
  def down
    drop_table :reviews
  end
end
