class AddTotalVotesColumnToReviewsTabe < ActiveRecord::Migration[5.0]
  def up
    add_column :reviews, :total_votes, :integer, default: 0
  end

  def down
    remove_column :reviews, :total_votes
  end
end
