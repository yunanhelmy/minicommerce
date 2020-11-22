class Orders::Entity::ItemList < Grape::Entity
  expose :store, using: Products::Entity::Store
  expose :items, using: Orders::Entity::CartItem
end
