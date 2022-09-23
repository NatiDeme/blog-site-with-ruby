module PostsHelper
    def num_of_comment(post)
    post.CommentsCounter.present? ? post.CommentsCounter : 0
  end

  def num_of_likes(post)
    post.LikesCounter.present? ? post.LikesCounter : 0
  end
end
