module API
  module V1
    module Orders
      module Resources
        class Checkout < API::V1::ApiResource
          helpers API::V1::Helpers

          resource 'orders' do
            desc 'Checkout Cart' do
              detail 'heckout Cart'
            end
            oauth2 'public'
            post "/cart/checkout" do
              result = ::Orders::Operation::Checkout.call(
                current_user: current_user, params: {}
              )
              render_result(result) do
                present :status, result.success?
                present :order, result[:data]
              end
            end
          end
        end
      end
    end
  end
end
