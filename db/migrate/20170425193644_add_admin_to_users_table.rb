class AddAdminToUsersTable < ActiveRecord::Migration[5.0]
  def up
    add_column :users, :admin, :boolean, default: false
  end

  def down
    remove_column :users, :admin
  end
end
