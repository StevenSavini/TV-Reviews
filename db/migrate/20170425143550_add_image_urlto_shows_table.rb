class AddImageUrltoShowsTable < ActiveRecord::Migration[5.0]
  def up
    add_column :shows, :image_url, :string, null: false, default: "http://www.hardwickagriculture.org/blog/wp-content/uploads/placeholder.jpg"
  end

  def down
    remove_column :shows, :image_url
  end
end
