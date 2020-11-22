class CreateProductProductVariants < ActiveRecord::Migration[6.0]
  def change
    create_table :product_product_variants do |t|
      t.integer :product_id
      t.integer :product_variant_id
      t.integer :stock

      t.timestamps
    end

    add_index :product_product_variants, [:product_id, :product_variant_id], name: 'variant_index'
  end
end
