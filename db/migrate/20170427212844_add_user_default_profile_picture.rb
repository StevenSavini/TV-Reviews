class AddUserDefaultProfilePicture < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :avatar
    add_column :users, :avatar, :string, default: "http://www.rutlandherald.com/wp-content/uploads/2017/03/default-user.png"
  end
end
