class Like < ApplicationRecord
  belongs_to :post
  belongs_to :user,class_name: 'User'

  def update_likes_counter
    post.increment!(:LikesCounter)
  end
end
