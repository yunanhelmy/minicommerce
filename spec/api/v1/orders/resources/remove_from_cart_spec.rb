require 'rails_helper'

RSpec.describe API::V1::Orders::Resources::RemoveFromCart, search: true do
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
      }

    Cart.reindex
  end

  it 'success' do
    product = Product.find_by(name: 'Sepatu Nike')

    delete '/v1/orders/cart',
      headers: auth_header(token),
      params: {
        product_id: product.id,
        variant_id: product.product_product_variants.last.id,
      }
    expect(response.status).to eq(200)
    expect(json_response[:data][:status]).to be_truthy
  end
end
