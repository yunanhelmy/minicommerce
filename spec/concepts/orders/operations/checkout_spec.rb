require 'rails_helper'

RSpec.describe Orders::Operation::Checkout do
  let(:current_user) { FactoryBot.create :user }

  before do
    Product.reindex
    Products::Repository::DummyData.call(m: 1, n: 1, name: 'Sepatu Nike')

    product = Product.find_by(name: 'Sepatu Nike')

    Orders::Operation::AddToCart.call(
      params: {
        product_id: product.id,
        variant_id: product.product_product_variants.last.id,
        quantity: 3
      },
      current_user: current_user
    )
  end

  it 'produce order_id' do
    result = described_class.call(current_user: current_user)
    expect(result.success?).to be_truthy
    expect(result[:data].serializable_hash[:id]).to be_truthy
  end
end
