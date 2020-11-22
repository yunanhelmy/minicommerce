require 'rails_helper'

RSpec.describe Products::Repository::Detail do
  before do
    Product.reindex
    Products::Repository::DummyData.call(m: 1, n: 1, name: 'Sepatu Nike')
  end

  it 'showed' do
    product = Product.find_by(name: 'Sepatu Nike')

    result = described_class.call(
      product.id
    )
    expect(result[:result][:id]).to eq(product.id.to_s)
  end
end
