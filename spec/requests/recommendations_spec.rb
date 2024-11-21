require 'rails_helper'

RSpec.describe 'Recommendations', type: :request do
  let(:user) { create(:user) }
  let(:auth_token) { JWT.encode({ user_id: user.id }, Rails.application.secrets.secret_key_base) }
  let(:headers) { { 'Authorization' => "Bearer #{auth_token}" } }
  let!(:category1_products) { create_list(:product, 3, category: 'Electronics') }
  let!(:category2_products) { create_list(:product, 3, category: 'Books') }

  before do
    order = create(:order, user: user)
    create(:order_item, order: order, product: category1_products[0])
  end

  describe 'GET /products/recommendations' do
    it 'returns products from similar categories' do
      get '/products/recommendations', headers: headers
      json = JSON.parse(response.body)
      expect(json.size).to be <= 5
      expect(json.map { |p| p['category'] }).to include('Electronics')
      expect(json.map { |p| p['category'] }).not_to include('Books')
    end
  end
end
