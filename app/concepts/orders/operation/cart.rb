class Orders::Operation::Cart < Trailblazer::Operation
  step :repository
  step :represent

  def repository(options, current_user:, **)
    options[:repository] = Orders::Repository::ShowCart.call(current_user.id)
  end

  def represent(options, **)
    options[:data] = Orders::Entity::Cart.represent(
      options[:repository][:result],
      serializable: true
    )
  end
end
