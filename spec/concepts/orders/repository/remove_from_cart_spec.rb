require 'rails_helper'

RSpec.describe Orders::Repository::RemoveFromCart do
  let(:current_user) { FactoryBot.create :user }
  let(:cart) { FactoryBot.create :cart, user_id: current_user.id }

  before do
    Product.reindex
    Products::Repository::DummyData.call(m: 1, n: 1, name: 'Sepatu Nike')

    @product = Product.find_by(name: 'Sepatu Nike')

    Orders::Repository::AddToCart.call(
      cart, @product, @product.product_product_variants.last, 3
    )
  end

  it 'success' do
    result = described_class.call(
      cart, @product, @product.product_product_variants.last
    )
    expect(result[:result]).to be_truthy
  end
end
