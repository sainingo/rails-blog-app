require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET #index' do
    before(:each) { get user_posts_path(1) }
    it 'should have a status code of 200 ' do
      expect(response).to have_http_status(200)
    end

    it 'should have a template of show' do
      expect(response).to render_template(:index)
    end

    it 'should have place holder of posts#index' do
      expect(response.body).to include('posts list')
    end
  end

  describe 'GET /show' do
    context 'when the page is loaded' do
      it 'returns a 200 status code and render template for show' do
        get '/users/1/posts', params: { id: 1 }
        expect(response).to have_http_status(200)
        expect(response).to render_template(:index)
      end
      it 'returns a 200 status code and render template for show' do
        get '/users/1/posts', params: { id: 1 }
        expect(response.body).to include('post')
      end
    end
  end
end
