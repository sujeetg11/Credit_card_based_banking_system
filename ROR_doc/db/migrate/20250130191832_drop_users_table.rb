class DropUsersTable < ActiveRecord::Migration[7.2]
  def up
    drop_table :users
  end

  def down
    create_table :users do |t|
      t.string :email, null: false
      t.string :encrypted_password, null: false
      t.string :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at
      t.timestamps
    end
  end
end
