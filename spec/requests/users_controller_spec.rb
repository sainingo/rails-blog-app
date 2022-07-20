require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET#index' do
    it 'should have a status of 200' do
      get users_path
      expect(response).to have_http_status(200)
    end

    it 'should show template index' do
      get users_path
      expect(response).to render_template(:index)
    end

    it 'should have content on page that says -show for users' do
      get users_path
      expect(response.body).to include('show users list')
    end
  end

  describe 'GET /show' do
    context 'when the page is loaded' do
      before do
        get '/users/1'
      end
      it 'returns a 200 status code' do
        expect(response).to have_http_status(200)
      end
      it 'should render correct template' do
        expect(response).to render_template(:show)
      end

      it 'should include correct placeholder text' do
        expect(response.body).to include('show user data')
      end
    end
  end
end
