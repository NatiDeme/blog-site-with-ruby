class CreateUser < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.text :Name
      t.string :Photo
      t.text :Bio
      t.timestamp :UpdatedAt
      t.timestamp :CreatedAt
      t.integer :PostCounter
    end
  end
end
