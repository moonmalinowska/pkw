class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :login
      t.string :password
      t.string :role
      t.string :crypted_password
      t.string :password_salt
      t.string :persistence_token
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
