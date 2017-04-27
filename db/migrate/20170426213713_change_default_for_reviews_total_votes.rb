class ChangeDefaultForReviewsTotalVotes < ActiveRecord::Migration[5.0]
  def change
    change_column :reviews, :total_votes, :integer, default: 0
  end
end
