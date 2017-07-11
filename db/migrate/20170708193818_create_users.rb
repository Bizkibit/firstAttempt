class CreateUsers < ActiveRecord::Migration[5.1]
  def up
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.date :age
      t.string :picture
      t.string :password_digest

      t.timestamps
    end
    add_index :users, :email, unique: true
  end

  def down
    remove_index :users, :email
    drop_table :users
  end
end
