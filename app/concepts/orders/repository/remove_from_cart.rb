class Orders::Repository::RemoveFromCart
  def self.call(cart, product, variant)
    result = CartItem.find_or_initialize_by(
      cart_id: cart.id,
      product_id: product.id,
      product_product_variant_id: variant.id,
      store_id: product.store_id
    )
    result.destroy

    cart.reindex if result.destroyed?

    {
      result: result
    }
  end
end
