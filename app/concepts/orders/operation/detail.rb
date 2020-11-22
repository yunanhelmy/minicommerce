class Orders::Operation::Detail < Trailblazer::Operation
  step :repository
  step :find_cart
  step :represent

  def repository(options, current_user:, params:, paginate: { page: 1, per_page: Pagy::VARS[:items] }, **)
    options[:repository] = Orders::Repository::OrderDetail.call(
      current_user.id,
      params[:order_id]
    )
  end

  def find_cart(options, current_user:, **)
    cart = Orders::Repository::ShowAnyCart.call(
      options[:repository][:result][:cart_id],
      current_user.id
    )
    options[:cart_data] = Orders::Entity::Cart.represent(
      cart[:result],
      serializable: true
    )
  end

  def represent(options, **)
    options[:data] = Orders::Entity::OrderDetail.represent(
      options[:repository][:result],
      cart: options[:cart_data]
    )
  end
end
