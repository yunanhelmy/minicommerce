require 'rails_helper'

RSpec.describe Users::Operation::Register do
  describe 'registration' do
    let!(:application) { create :application }

    it 'success' do
      result = described_class.call(
        params: {
          email: 'someone@gmail.com',
          password: 'password',
          password_confirmation: 'password'
        }
      )
      expect(result.success?).to be_truthy
    end

    it 'failed' do
      result = described_class.call(
        params: {
          email: 'someone@gmail.com',
          password: 'password',
          password_confirmation: 'password2'
        }
      )
      expect(result.failure?).to be_truthy
    end
  end
end
