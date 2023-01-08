class AddStepToDeliveries < ActiveRecord::Migration[6.1]
  def change
    add_column :deliveries, :step, :string
  end
end
