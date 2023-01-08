class CreateAngles < ActiveRecord::Migration[6.1]
  def change
    create_table :angles do |t|
      t.string :angle_name
      t.text :description
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
