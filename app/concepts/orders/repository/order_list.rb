class Orders::Repository::OrderList
  extend Pagy::Backend

  def self.call(user_id, paginate:)
    query = CustomerOrder.where(user_id: user_id).order('status desc, created_at desc')

    pagy, result = pagy(
      query,
      page: paginate[:page],
      items: paginate[:per_page],
    )

    {
      result: result,
      pagy: pagy
    }
  end
end
