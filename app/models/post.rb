class Post < ApplicationRecord
  validates :comments_counter, :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :title, presence: true, length: { maximum: 250 }

  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  belongs_to :author, class_name: 'User'

  def update_post_counter
    author.increment!(:posts_counter)
  end

  def recent_comments
    comments.last(5)
  end
end
