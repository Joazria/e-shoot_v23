class CreateCalendars < ActiveRecord::Migration[6.1]
  def change
    create_table :calendars do |t|
      t.date :deadline
      t.string :period
      t.string :manequin

      t.timestamps
    end
  end
end
