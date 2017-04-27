class AddReviewsColumnTimestamps < ActiveRecord::Migration[5.0]
  def up
    add_column :reviews, :created_at, :datetime
    add_column :reviews, :updated_at, :datetime
  end

  def down
    remove_column :reviews, :created_at, :datetime
    remove_column :reviews, :updated_at, :datetime
  end
end
