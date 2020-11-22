class Orders::Entity::OrderDetail < Grape::Entity
  expose :id
  expose :cart_id
  expose :status
  expose :cart do |instance, options|
    options[:cart]
  end
end
