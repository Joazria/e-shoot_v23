class AddAngleToOrders < ActiveRecord::Migration[6.1]
  def change
    add_reference :orders, :angle, null: true, foreign_key: true
    add_reference :orders, :category, null: true, foreign_key: true
    add_reference :orders, :size, null: true, foreign_key: true
  end
end
