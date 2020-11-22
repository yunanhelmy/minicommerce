module API
  module V1
    class ApiResource < Grape::API
      include API::V1::ExceptionHandlers

      AUTHORIZATION_HEADERS = { Authorization: { description: 'Authorization', required: true } }.freeze
    end
  end
end
