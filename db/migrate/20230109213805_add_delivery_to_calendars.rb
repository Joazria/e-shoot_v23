class AddDeliveryToCalendars < ActiveRecord::Migration[6.1]
  def change
    add_column :calendars, :delivery, :string
  end
end
