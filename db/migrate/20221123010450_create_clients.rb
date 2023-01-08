class CreateClients < ActiveRecord::Migration[6.1]
  def change
    create_table :clients do |t|
      t.string :company
      t.string :cnpj
      t.references :user, null: false, foreign_key: true
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :last_name
      t.string :first_name
      t.string :whatsapp
      t.string :phone

      t.timestamps
    end
  end
end
