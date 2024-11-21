require 'rails_helper'

RSpec.describe 'Authentication', type: :request do
  let(:user) { create(:user) }

  describe 'POST /signup' do
    it 'creates a new user' do
      post '/signup', params: { user: attributes_for(:user) }
      expect(response).to have_http_status(:created)
    end

    it 'returns an error if invalid data is provided' do
      post '/signup', params: { user: { email: '', password: '' } }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe 'POST /login' do
    it 'logs in with valid credentials' do
      post '/login', params: { email: user.email, password: 'password123' }
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)['token']).not_to be_nil
    end

    it 'returns an error with invalid credentials' do
      post '/login', params: { email: user.email, password: 'wrongpassword' }
      expect(response).to have_http_status(:unauthorized)
    end
  end
end
