class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :place
      t.datetime :time_from
      t.datetime :time_to
      t.boolean :remind
      t.boolean :visibility
      t.string :importance
      t.string :description

      t.timestamps
    end
  end
end
