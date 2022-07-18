require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /user' do
    it 'returns http success' do
      get '/users/user'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /post' do
    it 'returns http success' do
      get '/users/post'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /posts' do
    it 'returns http success' do
      get '/users/posts'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /users' do
    it 'returns http success' do
      get '/users/users'
      expect(response).to have_http_status(:success)
    end
  end
end
