require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET post' do
    before(:each) { get '/users/:author_id/posts' }

    it 'should return a 200 response' do
      expect(response).to have_http_status(:ok)
    end

    describe 'GET show' do
      before(:each) { get '/users/:author_id/posts/11' }

      it 'should return a 200 response' do
        expect(response).to have_http_status(:ok)
      end
    end

    describe 'GET new' do
      before(:each) { get '/users/:author_id/posts/new' }

      it 'should return a 200 response' do
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
