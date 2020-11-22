module ProductSearch
  extend ActiveSupport::Concern

  included do
    searchkick callbacks: false,
               searchable: [:name],
               word_start: [:name]
  end

  def search_data
    {}.merge(search_primary_data)
      .merge(store_information)
      .merge(variant_information)
  end

  def search_primary_data
    {
      created_at: created_at,
      updated_at: updated_at,
      name: name
    }
  end

  def store_information
    {
      store: {
        id: store.id,
        name: store.name
      }
    }
  end

  def variant_information
    data_variants = []
    product_product_variants.each do |variant|
      data_variants << {
        product_product_variant_id: variant.id,
        name: variant.product_variant.name,
        stock: variant.stock
      }
    end
    {
      variants: data_variants
    }
  end
end
