require 'rails_helper'

RSpec.describe API::V1::Products::Resources::List, type: :request do
  let!(:application) { FactoryBot.create :application }
  let!(:token)  { FactoryBot.create :access_token, :application => application, scopes: "public" }

  it 'success' do
    get "/v1/products", headers: auth_header(token),
                                  params: {
                                    page: 1,
                                    per_page: 2
                                  }
    expect(response.status).to eq(200)
  end
end
