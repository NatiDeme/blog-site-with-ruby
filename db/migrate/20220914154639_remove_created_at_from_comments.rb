# migration class
class RemoveCreatedAtFromComments < ActiveRecord::Migration[7.0]
  def change
    remove_column :comments, :created_at, :timestamp
    remove_column :comments, :updated_at, :timestamp
  end
end
