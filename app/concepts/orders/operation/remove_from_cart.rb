class Orders::Operation::RemoveFromCart < Trailblazer::Operation
  step :remove_from_cart

  def remove_from_cart(options, params:, current_user:, **)
    cart = Orders::Repository::FindCart.call(current_user.id)
    product = Product.find(params[:product_id])
    variant = ProductProductVariant.find(params[:variant_id])
    options[:repository] = Orders::Repository::RemoveFromCart.call(cart[:result], product, variant)
  end
end
