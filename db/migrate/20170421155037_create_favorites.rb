class CreateFavorites < ActiveRecord::Migration[5.0]
  def change
    create_table :favorites do |t|
      t.belongs_to :show
      t.belongs_to :user
      t.timestamps null: false
    end
  end
end
