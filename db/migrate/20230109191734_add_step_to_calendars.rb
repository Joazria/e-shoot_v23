class AddStepToCalendars < ActiveRecord::Migration[6.1]
  def change
    add_column :calendars, :step, :string
  end
end
