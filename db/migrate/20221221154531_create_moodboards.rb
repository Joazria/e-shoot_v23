class CreateMoodboards < ActiveRecord::Migration[6.1]
  def change
    create_table :moodboards do |t|
      t.string :moodboard_name
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
