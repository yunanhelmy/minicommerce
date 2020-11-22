class Orders::Entity::Cart < Grape::Entity
  expose :id
  expose :status
  expose :item_list, using: Orders::Entity::ItemList
end
