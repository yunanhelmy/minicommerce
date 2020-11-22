class CreateCustomerOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :customer_orders do |t|
      t.integer :cart_id
      t.integer :status

      t.timestamps
    end

    add_index :customer_orders, :cart_id
  end
end
