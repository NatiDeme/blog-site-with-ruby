class CreatePost < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.text :Title
      t.text :Text
      t.timestamp :UpdatedAt
      t.timestamp :CreatedAt
      t.integer :CommentsCounter
      t.integer :LikesCounter
    end
  end
end
