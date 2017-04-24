class ChangeTitleDescriptionColumnInReviewsTable < ActiveRecord::Migration[5.0]
  def up
    remove_column :reviews, :title
    remove_column :reviews, :description
    add_column :reviews, :title, :string
    add_column :reviews, :description, :string
  end
  
  def down
    remove_column :reviews, :title
    remove_column :reviews, :description
    add_column :reviews, :title, :string, null: false
    add_column :reviews, :description, :string, null: false
  end
end
