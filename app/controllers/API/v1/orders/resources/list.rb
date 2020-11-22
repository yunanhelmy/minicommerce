module API
  module V1
    module Orders
      module Resources
        class List < API::V1::ApiResource
          helpers API::V1::Helpers

          resource 'orders' do
            desc 'List of my orders' do
              is_array true
              failure API::V1::Helpers.resource_errors
              detail 'List of my orders'
            end
            params do
            end
            paginate per_page: Pagy::VARS[:items], max_per_page: Pagy::VARS[:max_per_page]
            oauth2 'public'
            get "/" do
              result = ::Orders::Operation::List.call(
                paginate: {
                  page: params[:page],
                  per_page: params[:per_page]
                },
                params: {},
                current_user: current_user
              )

              render_result(result) do
                present :orders, result[:data]
                present_metas_pagy result[:pagination]
              end
            end
          end
        end
      end
    end
  end
end
