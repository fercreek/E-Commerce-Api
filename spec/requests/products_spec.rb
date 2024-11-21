require 'rails_helper'

RSpec.describe 'Products', type: :request do
  let(:user) { create(:user) }
  let(:auth_token) { JWT.encode({ user_id: user.id }, Rails.application.secrets.secret_key_base) }
  let(:headers) { { 'Authorization' => "Bearer #{auth_token}" } }

  describe 'GET /products' do
    it 'returns a list of products' do
      create_list(:product, 5)
      get '/products'
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body).size).to eq(5)
    end
  end

  describe 'POST /products' do
    it 'creates a new product with valid data' do
      product_params = attributes_for(:product)
      post '/products', params: { product: product_params }, headers: headers
      expect(response).to have_http_status(:created)
    end

    it 'returns an error with invalid data' do
      post '/products', params: { product: { name: '' } }, headers: headers
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
