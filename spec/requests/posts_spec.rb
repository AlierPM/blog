require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before(:example) { get '/users/:user_id/posts' }
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
    it 'renders the index template' do
      expect(response).to render_template('index')
    end
    it 'response body includes the correct text' do
      expect(response.body).to include('Here is a list of posts for a given user')
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/users/1/posts/1'
      expect(response).to have_http_status(:success)
      expect(response).to render_template('show')
      expect(response.body).to include('Read each post here......')
    end
  end
end
