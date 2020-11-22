require 'rails_helper'

RSpec.describe API::V1::Products::Resources::Detail, type: :request do
  let!(:application) { FactoryBot.create :application }
  let!(:token)  { FactoryBot.create :access_token, :application => application, scopes: "public" }

  before do
    Products::Repository::DummyData.call(m: 1, n: 1, name: 'Sepatu Nike')
    @product = Product.find_by(name: 'Sepatu Nike')
  end

  it 'success' do
    get "/v1/products/#{@product.id}", headers: auth_header(token)
    expect(response.status).to eq(200)
  end
end
