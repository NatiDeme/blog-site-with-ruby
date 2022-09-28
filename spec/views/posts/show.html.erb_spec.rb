require 'rails_helper'

RSpec.describe 'posts/show.html.erb', type: :feature do
  before(:each) do
    @user1 = User.create(name: 'Tom', photo: 'https://www.w3schools.com/images/w3schools_green.jpg', bio: 'Mechanic',
                         posts_counter: 0)
    @post1 = Post.create(title: 'First Post', text: 'Hello', comments_counter: 0, likes_counter: 0, author: @user1)
    @post2 = Post.create(title: 'Second Post', text: 'test', comments_counter: 0, likes_counter: 0, author: @user1)
    @post3 = Post.create(title: 'Third Post', text: 'test', comments_counter: 0, likes_counter: 0, author: @user1)
    @comment1 = Comment.create(text: 'Keep it up!', author: @user1, post: @post1)

    visit user_post_path(@user1.id, @post1.id)
  end
  describe 'post show page' do
    it 'shows the post title' do
      expect(page).to have_content('First Post')
    end
    it 'shows the post body' do
      expect(page).to have_content('Hello')
    end
    it 'shows who wrote the post' do
      expect(page).to have_content('Tom')
    end
    it 'shows how many comments there are' do
      expect(page).to have_content('Comment')
    end
    it 'shows how many likes there are' do
      expect(page).to have_content('Likes')
    end
    it 'shows how many likes there are' do
      expect(page).to have_content('Likes')
    end
    it 'shows user name of commentor' do
      expect(page).to have_content('Tom')
    end
    it 'shows the comment content' do
      expect(page).to have_content('Keep it up!')
    end
  end
end
