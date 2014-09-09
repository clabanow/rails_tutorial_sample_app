class AddRememberTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :remember_token, :string

    # index is added because we expect to retrieve users by this method
    add_index  :users, :remember_token
  end
end
