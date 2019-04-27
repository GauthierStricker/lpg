class CreateSleepLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :sleep_logs do |t|
      t.time :start_time
      t.time :end_time
      t.float :sleep_duration
      t.date :date
      t.string :comment
      t.references :daily_journey, foreign_key: true
      t.references :area, foreign_key: true

      t.timestamps
    end
  end
end
