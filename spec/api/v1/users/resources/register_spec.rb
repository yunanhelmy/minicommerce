require 'rails_helper'

RSpec.describe API::V1::Users::Resources::Register, type: :request do
  describe 'registration' do
    let!(:application) { create :application }

    it 'success' do
      post "/v1/users", headers: nil,
                                    params: {
                                      email:      "someone@gmail.com",
                                      password:   "password",
                                      password_confirmation: "password",
                                    }
      expect(response.status).to eq(201)
    end

    it 'failed' do
      post "/v1/users", headers: nil,
                                    params: {
                                      email:      "someone@gmail.com",
                                      password:   "password",
                                      password_confirmation: "password2",
                                    }
      expect(response.status).to eq(422)
    end
  end
end
