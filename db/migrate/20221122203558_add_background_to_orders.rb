class AddBackgroundToOrders < ActiveRecord::Migration[6.1]
  def change
    add_reference :orders, :background, null: true, foreign_key: true
  end
end
