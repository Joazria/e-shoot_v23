class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.text :briefing
      t.string :amounts
      t.string :ref1
      t.string :ref2
      t.string :bg_color

      t.timestamps
    end
  end
end
