class CreateVotesTable < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.belongs_to :user
      t.belongs_to :review
      t.boolean :vote_value, null: false, default: false
      t.integer :value, null: false, default: 0
    end
  end
end
