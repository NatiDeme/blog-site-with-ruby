class User < ApplicationRecord
  has_many :posts, foriegn_key: 'author_id'
  has_many :comments, foriegn_key: 'author_id'
  has_many :likes, foriegn_key: 'author_id'

  def recent_posts
    posts.limit(3).order(created_at: :desc)
  end
end
