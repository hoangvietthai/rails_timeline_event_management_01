class AddColumnToUserEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :user_events, :permission, :integer, default: 1
  end
end
