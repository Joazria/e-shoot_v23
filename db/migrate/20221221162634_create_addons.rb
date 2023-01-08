class CreateAddons < ActiveRecord::Migration[6.1]
  def change
    create_table :addons do |t|
      t.string :addon_name
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
