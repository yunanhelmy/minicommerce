module API
  module V1
    module Orders
      module Resources
        class AddToCart < API::V1::ApiResource
          helpers API::V1::Helpers

          resource 'orders' do
            desc 'Add to cart' do
              detail 'Add item to cart (or update quantity)'
            end
            params do
              requires :product_id, type: Integer
              requires :variant_id, type: Integer
              requires :quantity, type: Integer
            end
            oauth2 'public'
            post "/cart" do
              result = ::Orders::Operation::AddToCart.call(
                current_user: current_user,
                params: {
                  product_id: params[:product_id],
                  variant_id: params[:variant_id],
                  quantity: params[:quantity]
                }
              )
              render_result(result) do
                present :status, result.success?
              end
            end
          end
        end
      end
    end
  end
end
