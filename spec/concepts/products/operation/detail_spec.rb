require 'rails_helper'

RSpec.describe Products::Operation::Detail do
  before do
    Product.reindex
    Products::Repository::DummyData.call(m: 1, n: 1, name: 'Sepatu Nike')
  end

  it 'showed' do
    product = Product.find_by(name: 'Sepatu Nike')

    result = described_class.call(
      params: {
        id: product.id
      }
    )
    expect(result.success?).to be_truthy
  end
end
