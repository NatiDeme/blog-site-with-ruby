require 'rails_helper'

RSpec.describe 'users/index.html.erb', type: :feature do
  before :each do
    @user1 = User.create(name: 'Tomm', photo: 'https://www.w3schools.com/images/w3schools_green.jpg', bio: 'Mechanic',
                         posts_counter: 0)
  end
  describe 'index page' do
    it 'shows the Number of posts' do
      visit root_path
      expect(page).to have_content('Number of posts')
    end
    it 'shows the list of users' do
      visit root_path
      expect(page).to have_content('Tomm')
    end
    it 'shows the user picture' do
      visit root_path
      expect(page).to have_css('img')
    end
    it 'Redirects to show page' do
      visit root_path
      click_link 'Tomm'
      expect(page).to have_content('Tomm')
    end
  end
end
