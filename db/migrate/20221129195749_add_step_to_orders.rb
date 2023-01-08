class AddStepToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :step, :string
  end
end
