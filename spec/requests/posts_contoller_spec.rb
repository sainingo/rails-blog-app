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

  describe 'GET #show' do
    user_id = 1
    id = 1
    before(:each) { get user_post_path user_id, id }

    it 'should have correct response status' do
      expect(response).to have_http_status(:ok)
    end

    it 'should render correct template for show' do
      expect(response).to render_template(:show)
    end

    it 'should include show for posts placeholder text' do
      expect(response.body).to include('posts show page')
    end
  end
end
