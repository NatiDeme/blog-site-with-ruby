# migration class
class CreateComment < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.text :text
      t.timestamp :UpdatedAt
      t.timestamp :CreatedAt

      t.timestamps
    end
  end
end
