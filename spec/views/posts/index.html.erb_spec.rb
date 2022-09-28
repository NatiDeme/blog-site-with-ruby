require 'rails_helper'

RSpec.describe 'posts/index.html.erb', type: :feature do
  before(:each) do
    @user1 = User.create(name: 'Tom', photo: 'https://www.w3schools.com/images/w3schools_green.jpg', bio: 'Mechanic',
                         posts_counter: 0)
    @post1 = Post.create(title: 'First Post', text: 'Hello', comments_counter: 0, likes_counter: 0, author: @user1)
    @post2 = Post.create(title: 'Second Post', text: 'test', comments_counter: 0, likes_counter: 0, author: @user1)
    @post3 = Post.create(title: 'Third Post', text: 'test', comments_counter: 0, likes_counter: 0, author: @user1)

    visit user_posts_path(@user1.id)
  end
  describe 'Posts index page' do
    it 'shows the user picture' do
      expect(page).to have_css('img')
    end
    it 'shows the list of users' do
      expect(page).to have_content('Tom')
    end
    it "show user's first 3 posts." do
      expect(page).to have_content 'First Post'
      expect(page).to have_content 'Second Post'
      expect(page).to have_content 'Third Post'
    end
    it 'show user post body' do
      expect(page).to have_content 'Hello'
      expect(page).to have_content 'test'
      expect(page).to have_content 'test'
    end
    it 'shows the Number of Likes' do
      expect(page).to have_content('likes')
    end
    it 'shows Pagination' do
      expect(page).to have_content('Pagination')
    end
  end
end
