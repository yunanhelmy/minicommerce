module API
  module V1
    module Products
      module Resources
        class Detail < API::V1::ApiResource
          helpers API::V1::Helpers

          resource 'products' do
            desc 'Detail of product' do
              detail 'Detail of product'
            end
            oauth2 'public'
            get "/:id" do
              result = ::Products::Operation::Detail.call(
                params: {
                  id: params[:id]
                }
              )

              render_result(result) do
                present :product, result[:data]
              end
            end
          end
        end
      end
    end
  end
end
