require 'rails_helper'

RSpec.describe Orders::Repository::OrderList do
  let(:current_user) { FactoryBot.create :user }
  let(:cart) { FactoryBot.create :cart, user_id: current_user }
  let(:customer_order) { FactoryBot.create :customer_order, user_id: current_user.id, cart_id: cart.id }

  it 'success' do
    result = described_class.call(current_user.id, paginate: { page: 1, per_page: 2 })
    expect(result[:result]).to be_truthy
  end
end
