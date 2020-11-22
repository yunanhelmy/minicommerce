class AddUserIdCustomerOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :customer_orders, :user_id, :integer

    add_index :customer_orders, :user_id
  end
end
