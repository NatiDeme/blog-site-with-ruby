require 'rails_helper'

RSpec.describe 'posts/index.html.erb', type: :feature do
  before (:each) do
    @user1 = User.first
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
      expect(page).to have_content 'Hello'
      expect(page).to have_content 'test'
      expect(page).to have_content 'test'
    end
      it "show user's first 3 posts." do
      expect(page).to have_content 'This is my first post'
      expect(page).to have_content 'this is test'
      expect(page).to have_content 'this is test'
    end
    it 'shows the Number of Likes' do
      expect(page).to have_content('Likes')
    end
    it 'shows Pagination' do
      expect(page).to have_content('Pagination')
    end
  end
end
