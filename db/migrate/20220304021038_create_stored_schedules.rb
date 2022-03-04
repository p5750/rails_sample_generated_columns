class CreateStoredSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :stored_schedules do |t|
      t.string :name
      t.datetime :starts_at, index: true
      t.virtual :start_month, type: :integer, as: "MONTH(starts_at)", stored: true
      t.virtual :start_day, type: :integer, as: "DAY(starts_at)", stored: true

      t.index [:start_month, :start_day]

      t.timestamps
    end
  end
end
