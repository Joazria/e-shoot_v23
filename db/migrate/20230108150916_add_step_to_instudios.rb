class AddStepToInstudios < ActiveRecord::Migration[6.1]
  def change
    add_column :instudios, :step, :string
  end
end
