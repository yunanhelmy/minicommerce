module API
  module V1
    module Products
      class Routes < Grape::API
        formatter :json, ::API::SuccessFormatter
        error_formatter :json, ::API::ErrorFormatter

        mount API::V1::Products::Resources::Detail
        mount API::V1::Products::Resources::List
      end
    end
  end
end
