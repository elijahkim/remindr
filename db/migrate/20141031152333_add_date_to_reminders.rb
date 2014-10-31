class AddDateToReminders < ActiveRecord::Migration
  def change
    add_column :reminders, :remind_at, :timestamp
    remove_column :reminders, :time

  end
end
