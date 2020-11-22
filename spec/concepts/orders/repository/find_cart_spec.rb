require 'rails_helper'

RSpec.describe Orders::Repository::FindCart do
  let(:current_user) { FactoryBot.create :user }

  it 'success' do
    result = described_class.call(current_user.id)
    expect(result[:result]).to be_truthy
  end
end
