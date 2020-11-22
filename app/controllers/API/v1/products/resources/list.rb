module API
  module V1
    module Products
      module Resources
        class List < API::V1::ApiResource
          helpers API::V1::Helpers

          resource 'products' do
            desc 'List of products' do
              is_array true
              failure API::V1::Helpers.resource_errors
              detail 'List of products'
            end
            params do
              optional :search, description: 'Search Keyword'
              optional :store_ids, type: Array[Integer], description: 'Filter by store_ids', documentation: { param_type: 'query', collectionFormat: 'multi' }
            end
            paginate per_page: Pagy::VARS[:items], max_per_page: Pagy::VARS[:max_per_page]
            oauth2 'public'
            get "/" do
              result = ::Products::Operation::List.call(
                paginate: {
                  page: params[:page],
                  per_page: params[:per_page]
                },
                params: {
                  search: params[:search],
                  store_ids: params[:store_ids]
                }
              )

              render_result(result) do
                present :products, result[:data]
                present_metas_pagy result[:pagination]
              end
            end
          end
        end
      end
    end
  end
end
