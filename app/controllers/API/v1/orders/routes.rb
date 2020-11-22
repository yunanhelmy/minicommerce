module API
  module V1
    module Orders
      class Routes < Grape::API
        formatter :json, ::API::SuccessFormatter
        error_formatter :json, ::API::ErrorFormatter

        mount API::V1::Orders::Resources::Cart
        mount API::V1::Orders::Resources::AddToCart
        mount API::V1::Orders::Resources::RemoveFromCart
        mount API::V1::Orders::Resources::Checkout
        mount API::V1::Orders::Resources::List
        mount API::V1::Orders::Resources::Detail
      end
    end
  end
end
