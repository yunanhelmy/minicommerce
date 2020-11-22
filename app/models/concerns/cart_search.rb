module CartSearch
  extend ActiveSupport::Concern

  included do
    searchkick callbacks: false
  end

  def search_data
    {}.merge(search_primary_data)
      .merge(item_information)
  end

  def search_primary_data
    {
      user_id: user_id,
      id: id,
      status: status,
      created_at: created_at,
      updated_at: updated_at
    }
  end

  def item_information
    items = []
    data = cart_items.group_by {|k, v| [k.store_id, k.store.name] }
    data.to_a.each do |datum|
      items << {
        store: {
          id: datum.first.first,
          name: datum.first.last
        },
        items: items_detail(datum.last)
      }
    end
    {
      item_list: items
    }
  end

  def items_detail(items)
    data = []
    items.each do |item|
      data << {
        id: item.id,
        product: {
          id: item.product_id,
          name: item.product.name
        },
        variant: {
          id: item.product_product_variant_id,
          name: item.product_product_variant.product_variant.name
        },
        quantity: item.quantity
      }
    end
    data
  end
end
