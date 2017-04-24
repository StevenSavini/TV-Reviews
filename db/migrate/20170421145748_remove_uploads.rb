class RemoveUploads < ActiveRecord::Migration[5.0]
  def change
    drop_table :uploads
  end
end
