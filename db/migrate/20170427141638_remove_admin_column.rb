class RemoveAdminColumn < ActiveRecord::Migration[5.0]
  def up
    remove_column :users, :admin
  end

  def down
    add_column :users, :admin, :string, default: "members", null: false
  end
end
