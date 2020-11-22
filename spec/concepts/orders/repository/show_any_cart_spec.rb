require 'rails_helper'

RSpec.describe Orders::Repository::ShowAnyCart, search: true do
  let(:current_user) { FactoryBot.create :user }
  let(:cart) { FactoryBot.create :cart, user_id: current_user.id }

  before do
    Product.reindex
    Products::Repository::DummyData.call(m: 1, n: 1, name: 'Sepatu Nike')

    product = Product.find_by(name: 'Sepatu Nike')

    Orders::Repository::AddToCart.call(
      cart, product, product.product_product_variants.last, 3
    )

    Orders::Repository::Checkout.call(cart)
    Cart.reindex
  end

  it 'success' do
    result = described_class.call(cart.id, current_user.id)
    expect(result[:result]).to be_truthy
  end
end
