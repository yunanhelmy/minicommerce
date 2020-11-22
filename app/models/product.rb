class Product < ApplicationRecord
  include ProductSearch

  belongs_to :store, optional: true
  has_many :product_product_variants
  has_many :product_variants, through: :product_product_variants
end
