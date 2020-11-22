module API
  module V1
    module Orders
      module Resources
        class RemoveFromCart < API::V1::ApiResource
          helpers API::V1::Helpers

          resource 'orders' do
            desc 'Remove from cart' do
              detail 'Remove item from cart'
            end
            params do
              requires :product_id, type: Integer
              requires :variant_id, type: Integer
            end
            oauth2 'public'
            delete "/cart" do
              result = ::Orders::Operation::RemoveFromCart.call(current_user: current_user,params: {product_id: params[:product_id],variant_id: params[:variant_id]})
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
