module UsersHelper
    def num_of_post(user)
    user.posts_counter.present? ? user.posts_counter : 0
  end
end
