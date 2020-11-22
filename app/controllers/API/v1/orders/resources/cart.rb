module API
  module V1
    module Orders
      module Resources
        class Cart < API::V1::ApiResource
          helpers API::V1::Helpers

          resource 'orders' do
            desc 'Cart' do
              detail 'Cart'
            end
            oauth2 'public'
            get "/cart" do
              result = ::Orders::Operation::Cart.call(current_user: current_user)
              render_result(result) do
                present :cart, result[:data]
              end
            end
          end
        end
      end
    end
  end
end
