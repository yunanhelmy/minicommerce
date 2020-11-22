class Products::Entity::Product < Grape::Entity
  expose :id do |instance|
    instance.id.to_i
  end
  expose :name
  expose :store, using: Products::Entity::Store
  expose :variants, using: Products::Entity::Variant
end
