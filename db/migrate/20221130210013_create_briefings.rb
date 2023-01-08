class CreateBriefings < ActiveRecord::Migration[6.1]
  def change
    create_table :briefings do |t|
      t.text :release
      t.string :ref1
      t.string :ref2
      t.references :order, null: true, foreign_key: true

      t.timestamps
    end
  end
end
