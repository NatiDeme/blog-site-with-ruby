class User < ApplicationRecord
  validates :Name, presence: true
  validates :Bio, presence: true
  validates :PostCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  has_many :posts
  has_many :comments
  has_many :likes

  def recent_posts
    posts.last(3)
  end
end
