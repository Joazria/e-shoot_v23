class AddRefToCalendars < ActiveRecord::Migration[6.1]
  def change
    add_reference :calendars, :instudio, null: true, foreign_key: true
  end
end
