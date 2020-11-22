class Orders::Operation::Checkout < Trailblazer::Operation
  step :checkout
  step :represent

  def checkout(options, current_user:, **)
    cart = Cart.find_by!(status: :shopping, user_id: current_user.id)
    CartItem.find_by!(cart_id: cart.id)
    options[:repository] = Orders::Repository::Checkout.call(cart)
  end

  def represent(options, **)
    options[:data] = Orders::Entity::Order.represent(options[:repository][:result])
  end
end
