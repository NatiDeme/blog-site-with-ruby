require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before(:example) { get user_posts_path(1) }
    it 'returns http success' do
      # get '/posts/index'
      expect(response).to have_http_status(:success)
    end
    it 'Test if action rendered a correct template' do
      expect(response).to render_template('index')
    end
  end

  describe 'GET /show' do
    before(:example) { get user_post_path(1, 2) }
    it 'returns http success' do
      # get '/posts/show'
      expect(response).to have_http_status(:success)
    end
    it 'Test if action rendered a correct template' do
      expect(response).to render_template('show')
    end
  end
end
