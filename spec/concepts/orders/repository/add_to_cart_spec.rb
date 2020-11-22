require 'rails_helper'

RSpec.describe Orders::Repository::AddToCart do
  let(:current_user) { FactoryBot.create :user }
  let(:cart) { FactoryBot.create :cart, user_id: current_user.id }

  before do
    Product.reindex
    Products::Repository::DummyData.call(m: 1, n: 1, name: 'Sepatu Nike')
  end

  it 'success' do
    product = Product.find_by(name: 'Sepatu Nike')

    result = described_class.call(
      cart, product, product.product_product_variants.last, 3
    )
    expect(result[:result]).to be_truthy
  end
end
