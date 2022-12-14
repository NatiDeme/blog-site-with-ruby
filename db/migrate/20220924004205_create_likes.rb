class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes, &:timestamps

    add_reference(:likes, :author, foreign_key: { to_table: :users }, index: true)
    add_reference(:likes, :post, index: true)
  end
end
