README.md

# This is where your migration files will go once you use:
be rake generate:migration NAME=create_users

# Titles like:
2017112115851_create_users.rb


class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :hashed_password, null: false

      t.timestamps(null: false)
    end
  end
end


# Can also use t.integer, t.boolean, etc.
