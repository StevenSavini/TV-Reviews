class CreateShows < ActiveRecord::Migration[5.0]
  def change
    create_table :shows do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.integer :average_rating, numericality: true, allow_nil: true

      t.timestamps null: false
    end
  end
end
