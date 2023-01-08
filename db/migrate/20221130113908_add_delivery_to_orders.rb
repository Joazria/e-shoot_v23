class AddDeliveryToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :delivery_url, :string
    add_column :orders, :delivery_date, :date
  end
end
