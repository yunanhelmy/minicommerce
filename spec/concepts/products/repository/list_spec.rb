require 'rails_helper'

RSpec.describe Products::Repository::List, search: true do
  before do
    Product.reindex
    Products::Repository::DummyData.call
    Products::Repository::DummyData.call(m: 1, n: 1, name: 'Sepatu Nike')
  end

  it 'listed' do
    result = described_class.call(
      '*',
      filter: {},
      paginate: { page: 1, per_page: 100 }
    )
    expect(result[:result].size).to eq(16)
  end

  it 'search by keyword' do
    result = described_class.call(
      'sepatu',
      filter: {},
      paginate: { page: 1, per_page: 100 }
    )
    expect(result[:result].size).to eq(1)
  end

  it 'filter by store_id' do
    store_id = Product.where(name: 'Sepatu Nike').last.store_id

    result = described_class.call(
      'sepatu',
      filter: { :'store.id' => store_id },
      paginate: { page: 1, per_page: 100 }
    )
    expect(result[:result].size).to eq(1)

    result = described_class.call(
      'sandal',
      filter: { :'store.id' => store_id },
      paginate: { page: 1, per_page: 100 }
    )
    expect(result[:result].size).to eq(0)

    result = described_class.call(
      '*',
      filter: { :'store.id' => store_id },
      paginate: { page: 1, per_page: 100 }
    )
    expect(result[:result].size).to eq(1)
  end

  describe 'pagination' do
    it 'page 1' do
      result = described_class.call(
        '*',
        filter: {},
        paginate: { page: 1, per_page: 10 }
      )
      expect(result[:result].size).to eq(10)
    end

    it 'page 2' do
      result = described_class.call(
        '*',
        filter: {},
        paginate: { page: 2, per_page: 10 }
      )
      expect(result[:result].size).to eq(6)
    end
  end
end
