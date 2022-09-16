class Post < ApplicationRecord
  validates :comments_counter, :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :title, presence: true, length: { maximum: 250 }
  
  has_many :likes, foreign_key: 'post_id'
  has_many :comments, foreign_key: 'post_id'
  belongs_to :author, class_name: 'User'

  def update_post_counter
    user.increment!(:posts_counter)
  end

  def recent_comments
    comments.limit(5).order(created_at: :desc)
  end
end
