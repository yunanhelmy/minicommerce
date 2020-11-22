class Orders::Operation::AddToCart < Trailblazer::Operation
  step :add_to_cart

  def add_to_cart(options, params:, current_user:, **)
    cart = Orders::Repository::FindCart.call(current_user.id)
    product = Product.find(params[:product_id])
    variant = ProductProductVariant.find(params[:variant_id])
    options[:repository] = Orders::Repository::AddToCart.call(cart[:result], product, variant, params[:quantity])
  end
end
