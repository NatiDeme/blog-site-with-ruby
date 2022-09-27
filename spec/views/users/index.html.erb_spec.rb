require 'rails_helper'

RSpec.describe 'users/index.html.erb', type: :feature do
  before :each do
    @user = User.first
  end
  describe 'index page' do
    it 'shows the Number of posts' do
      visit root_path
      expect(page).to have_content('Number of posts')
    end
    it 'shows the list of users' do
      visit root_path
      expect(page).to have_content('Lilly')
      expect(page).to have_content('Tom')
    end
    it 'shows the user picture' do
      visit root_path
      expect(page).to have_css('img')
  end
  it 'Redirects to show page' do
      visit root_path
      click_link "Tom"
      expect(page).to have_content('Tom')
  end
  end
end
