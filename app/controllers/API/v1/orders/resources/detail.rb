module API
  module V1
    module Orders
      module Resources
        class Detail < API::V1::ApiResource
          helpers API::V1::Helpers

          resource 'orders' do
            desc 'Detail order' do
              failure API::V1::Helpers.resource_errors
              detail 'Detail order'
            end
            oauth2 'public'
            get "/:order_id" do
              result = ::Orders::Operation::Detail.call(
                params: { order_id: params[:order_id] },
                current_user: current_user
              )

              render_result(result) do
                present :order, result[:data]
              end
            end
          end
        end
      end
    end
  end
end
