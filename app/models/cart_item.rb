class CartItem < ApplicationRecord
  belongs_to :store, optional: true
  belongs_to :cart, optional: true
  belongs_to :product, optional: true
  belongs_to :product_product_variant, optional: true
end
