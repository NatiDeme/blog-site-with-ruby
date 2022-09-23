module UsersHelper
    def num_of_post(user)
    user.PostCounter.present? ? user.PostCounter : 0
  end
end
