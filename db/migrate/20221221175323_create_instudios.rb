class CreateInstudios < ActiveRecord::Migration[6.1]
  def change
    create_table :instudios do |t|
      t.references :product, null: true, foreign_key: true
      t.references :moodboard, null: true, foreign_key: true
      t.references :addon, null: true, foreign_key: true
      t.references :user, null: true, foreign_key: true
      t.references :client, null: true, foreign_key: true

      t.timestamps
    end
  end
end
