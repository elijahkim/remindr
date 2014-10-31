class CreateReminders < ActiveRecord::Migration
  def change
    create_table :reminders do |t|
      t.string :content
      t.time :time
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
