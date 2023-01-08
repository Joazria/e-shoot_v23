class CreateBackgrounds < ActiveRecord::Migration[6.1]
  def change
    create_table :backgrounds do |t|
      t.string :bg_color
      t.string :bg_name
      t.text :description
      t.references :category, null: true, foreign_key: true

      t.timestamps
    end
  end
end
