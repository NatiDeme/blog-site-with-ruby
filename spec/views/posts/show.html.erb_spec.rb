require 'rails_helper'

RSpec.describe 'posts/show.html.erb', type: :view do
  before(:each) do
    @post1 = Post.first
    visit post_path(@post1.id)
  end
  describe 'user show page' do
    it 'shows the profile picture' do
      expect(page).to have_css('title')
    end
    it 'shows the list of users' do
      expect(page).to have_content('text')
    end
    it 'shows the Number of posts' do
      expect(page).to have_content('Number of comments')
    end
    
   
  end

end
