require 'rails_helper'

RSpec.describe 'users/index.html.erb', type: :feature do
  describe 'index page' do
    it 'shows the Number of posts' do
      visit root_path
      expect(page).to have_content('Number of posts')
    end
  end
end
