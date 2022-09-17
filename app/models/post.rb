class Post < ApplicationRecord
  validates :CommentsCounter, :LikesCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :Title, presence: true, length: { maximum: 250 }

  has_many :likes
  has_many :comments

  belongs_to :user

  def update_post_counter
    user.update(PostCounter: user.posts.size)
  end

  def recent_comments
    comments.last(5)
  end
end