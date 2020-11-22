class Orders::Repository::Checkout
  def self.call(cart)
    cart.update(status: :checkouted)
    customer_order = CustomerOrder.create(cart_id: cart.id, user_id: cart.user_id, status: :checkout)
    cart.reindex
    {
      result: customer_order
    }
  end
end
