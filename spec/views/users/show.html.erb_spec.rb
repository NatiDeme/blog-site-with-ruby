require 'rails_helper'

RSpec.describe 'users/show.html.erb', type: :feature do
  before(:each) do
    @user1 = User.create(name: 'Tom', photo: 'https://www.w3schools.com/images/w3schools_green.jpg', bio: 'Mechanic',
                         posts_counter: 0)
    @post1 = Post.create(title: 'First Post', text: 'Hello', comments_counter: 0, likes_counter: 0, author: @user1)
    @post2 = Post.create(title: 'Second Post', text: 'test', comments_counter: 0, likes_counter: 0, author: @user1)
    @post3 = Post.create(title: 'Third Post', text: 'test', comments_counter: 0, likes_counter: 0, author: @user1)
    visit user_path(@user1.id)
  end
  describe 'user show page' do
    it 'shows the profile picture' do
      expect(page).to have_css('img')
    end
    it 'shows the list of users' do
      expect(page).to have_content('Tom')
    end
    it 'shows the Number of posts' do
      expect(page).to have_content('Number of posts')
    end
     it 'shows the Number of posts' do
      expect(page).to have_content('Bio')
    end
      it "show user's first 3 posts." do
      expect(page).to have_content 'Hello'
      expect(page).to have_content 'test'
      expect(page).to have_content 'test'
    end
      it "show link to all of a user's posts." do
      expect(page).to have_link('See all posts')
    end
     it "click see all posts and redirects to user's post's index page." do
      click_link 'See all posts'
      expect(page).to have_current_path user_posts_path(@user1)
    end
  end
end
