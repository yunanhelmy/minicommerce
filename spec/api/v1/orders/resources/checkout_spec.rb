require 'rails_helper'

RSpec.describe API::V1::Orders::Resources::Checkout, search: true do
  let(:current_user) { FactoryBot.create :user }
  let(:cart) { FactoryBot.create :cart, user_id: current_user.id }
  let!(:application) { FactoryBot.create :application }
  let!(:token)  { FactoryBot.create :access_token, :application => application, scopes: "public", resource_owner_id: current_user.id }

  before do
    Product.reindex
    Products::Repository::DummyData.call(m: 1, n: 1, name: 'Sepatu Nike')

    product = Product.find_by(name: 'Sepatu Nike')

    post '/v1/orders/cart',
      headers: auth_header(token),
      params: {
        product_id: product.id,
        variant_id: product.product_product_variants.last.id,
        quantity: 1
      }

    Cart.reindex
  end

  it 'success' do
    post '/v1/orders/cart/checkout',
      headers: auth_header(token)
    expect(response.status).to eq(201)
    expect(json_response[:data][:status]).to be_truthy
    expect(json_response[:data][:order][:id]).to be_truthy
  end
end
