class Orders::Repository::AddToCart
  def self.call(cart, product, variant, quantity)
    result = CartItem.find_or_initialize_by(
      cart_id: cart.id,
      product_id: product.id,
      product_product_variant_id: variant.id,
      store_id: product.store_id
    )
    result.quantity = quantity
    result.save

    cart.reindex if result

    {
      result: result
    }
  end
end
