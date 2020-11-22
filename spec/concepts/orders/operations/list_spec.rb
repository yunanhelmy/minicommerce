require 'rails_helper'

RSpec.describe Orders::Operation::List, search: true do
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

    result = Orders::Operation::Checkout.call(current_user: current_user)
    @order_id = result[:data].serializable_hash[:id]
    Cart.reindex
  end

  it 'showing my list of order' do
    result = described_class.call(
      current_user: current_user,
      params: {},
      paginate: { page: 1, per_page: 2 }
    )
    expect(result.success?).to be_truthy
    expect(result[:data].size).to eq(1)
  end
end
