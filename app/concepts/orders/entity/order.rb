class Orders::Entity::Order < Grape::Entity
  expose :id
  expose :cart_id
  expose :status
end
