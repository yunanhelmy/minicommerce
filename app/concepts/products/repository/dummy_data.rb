class Products::Repository::DummyData
  def self.call(name: nil, m: 3, n: 5)
    generate_products(m, n, name)
    Product.reindex
  end

  def self.generate_products(m, n, name)
    m.times do
      store = FactoryBot.create :store
      n.times do
        product = if name
          FactoryBot.create :product, store_id: store.id, name: name
        else
          FactoryBot.create :product, store_id: store.id
        end
        (1..10).to_a.sample.times do
          variant = FactoryBot.create :product_variant
          FactoryBot.create :product_product_variant, product_variant_id: variant.id, product_id: product.id, stock: (1..10).to_a.sample
        end
      end
    end
  end
end
