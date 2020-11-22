class API::V1::Metas::Entities::Meta < Grape::Entity
  expose :pages do
    expose :total_pages, as: :total
    expose :limit_value, as: :per_page
    expose :current_page, as: :page
  end
end
