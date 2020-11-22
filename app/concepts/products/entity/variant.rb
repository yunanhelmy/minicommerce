class Products::Entity::Variant < Grape::Entity
  expose :product_product_variant_id, as: :id
  expose :name
  expose :stock
end
