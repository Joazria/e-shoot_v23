class RemoveBriefingFromOrders < ActiveRecord::Migration[6.1]
  def change
    remove_column :orders, :briefing, :string
    add_column :orders, :release, :text

  end
end
