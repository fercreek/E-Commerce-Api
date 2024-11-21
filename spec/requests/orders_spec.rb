require 'rails_helper'

RSpec.describe 'Orders', type: :request do
  let(:user) { create(:user) }
  let(:auth_token) { JWT.encode({ user_id: user.id }, Rails.application.secrets.secret_key_base) }
  let(:headers) { { 'Authorization' => "Bearer #{auth_token}" } }
  let(:product) { create(:product) }

  describe 'POST /orders' do
    it 'creates a new order with valid data' do
      order_params = {
        order: {
          status: 'pending',
          order_items_attributes: [
            { product_id: product.id, quantity: 2, price: product.price }
          ]
        }
      }
      post '/orders', params: order_params, headers: headers
      expect(response).to have_http_status(:created)
    end

    it 'returns an error with invalid data' do
      post '/orders', params: { order: { status: '' } }, headers: headers
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
