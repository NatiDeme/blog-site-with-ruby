class Like < ApplicationRecord
  belongs_to :post
  belongs_to :user
  
  after_create :update_likes_counter

  def update_likes_counter
    post.update(LikesCounter: post.likes.size)
  end
end
