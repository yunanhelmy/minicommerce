class Orders::Repository::OrderDetail
  def self.call(user_id, order_id)
    query = CustomerOrder.find_by(user_id: user_id, id: order_id)

    {
      result: query
    }
  end
end
