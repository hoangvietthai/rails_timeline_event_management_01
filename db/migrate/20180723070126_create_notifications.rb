class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.datetime :notify_before
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
