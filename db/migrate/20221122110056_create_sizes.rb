class CreateSizes < ActiveRecord::Migration[6.1]
  def change
    create_table :sizes do |t|
      t.string :size_name
      t.text :description
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
