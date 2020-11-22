class Orders::Operation::List < Trailblazer::Operation
  step :repository
  step :represent

  def repository(options, current_user:, params:, paginate: { page: 1, per_page: Pagy::VARS[:items] }, **)
    options[:repository] = Orders::Repository::OrderList.call(
      current_user.id,
      paginate: paginate
    )
  end

  def represent(options, **)
    options[:pagination] = options[:repository][:pagy]
    options[:data] = Orders::Entity::Order.represent(
      options[:repository][:result],
      serializable: true
    )
  end
end
