module API
  module V1
    module Users
      class Routes < Grape::API
        formatter :json, ::API::SuccessFormatter
        error_formatter :json, ::API::ErrorFormatter

        mount API::V1::Users::Resources::Register
      end
    end
  end
end
