# migration class
class CreateLike < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.timestamp :UpdatedAt
      t.timestamp :CreatedAt
    end
  end
end