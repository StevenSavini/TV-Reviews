class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.integer :rating, numericality: true, allow_nil: true

      t.belongs_to :show
      t.belongs_to :user
    end
  end
end
