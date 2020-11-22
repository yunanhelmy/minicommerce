require 'rails_helper'

RSpec.describe Products::Operation::List do
  before do
    Product.reindex
    Products::Repository::DummyData.call
    Products::Repository::DummyData.call(m: 1, n: 1, name: 'Sepatu Nike')
  end

  it 'listed' do
    result = described_class.call(
      params: {},
      paginate: { page: 1, per_page: 100 }
    )
    expect(result.success?).to be_truthy
    expect(result[:data].size).to eq(16)
  end

  it 'search by keyword' do
    result = described_class.call(
      params: {
        search: 'sepatu'
      },
      paginate: { page: 1, per_page: 100 }
    )
    expect(result.success?).to be_truthy
    expect(result[:data].size).to eq(1)
  end

  it 'filter by store_ids' do
    store_id = Product.where(name: 'Sepatu Nike').last.store_id

    result = described_class.call(
      params: {
        store_ids: [store_id, 99]
      },
      paginate: { page: 1, per_page: 100 }
    )
    expect(result[:data].size).to eq(1)
  end
end
