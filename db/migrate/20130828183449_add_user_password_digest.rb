class AddUserPasswordDigest < ActiveRecord::Migration
  def change
    # Add a new column :password_digest of the type :string to the table :users
    add_column :users, :password_digest, :string
  end
end
