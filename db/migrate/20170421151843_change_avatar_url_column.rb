class ChangeAvatarUrlColumn < ActiveRecord::Migration[5.0]
  def up
    rename_column :users, :avatar_url, :avatar
  end
  
  def down
    rename_column :users, :avatar, :avatar_url
  end
end
