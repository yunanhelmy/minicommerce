class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :store_id

      t.timestamps
    end

    add_index :products, :store_id
  end
end
