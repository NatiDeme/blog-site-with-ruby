class User < ApplicationRecord
  validates :Name, presence: true
  validates :Bio, presence: true
  validates :PostCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  has_many :posts, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'

  def recent_posts
    posts.last(3)
  end
end
