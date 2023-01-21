require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    before(:example) { get users_path(1) }
    it 'returns http success' do
      expect(response).to have_http_status(:success)
      expect(response).to render_template('index')
      expect(response.body).to include('Welcome to 1-in-all Blogging site.....')
    end
  end

  describe 'GET /show' do
    before(:example) { get user_path(1) }
    it 'returns http success' do
      expect(response).to have_http_status(:success)
      expect(response).to render_template('show')
      expect(response.body).to include('Meet your finest authors here')
    end
  end
end
