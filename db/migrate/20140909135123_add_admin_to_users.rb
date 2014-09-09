class AddAdminToUsers < ActiveRecord::Migration
  def change
    # new users should not be admins by default
    add_column :users, :admin, :boolean, default: false
  end
end
