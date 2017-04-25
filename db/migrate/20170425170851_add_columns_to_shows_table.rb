class AddColumnsToShowsTable < ActiveRecord::Migration[5.0]
  def up
    add_column :shows, :description, :string, null: false, default: ""
    add_column :shows, :premiere_date, :string, null: false, default: ""
  end

  def down
    remove_column :shows, :description
    remove_column :shows, :premiere_date
  end
end
