class RemoveColumnDescriptionFromShowsTable < ActiveRecord::Migration[5.0]
  def up
    remove_column :shows, :description
  end

  def down
    add_column :shows, :description, :string, null: false
  end
end
