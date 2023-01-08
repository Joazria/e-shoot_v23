class CreateDeliveries < ActiveRecord::Migration[6.1]
  def change
    create_table :deliveries do |t|
      t.date :delivery_date
      t.string :delivery_link
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
