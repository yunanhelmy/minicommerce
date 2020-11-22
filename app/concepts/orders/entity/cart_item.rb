class Orders::Entity::CartItem < Grape::Entity
  expose :id
  expose :quantity
  expose :product, using: Orders::Entity::SimpleProduct
  expose :variant, using: Orders::Entity::SimpleVariant
end
