class CreateMoodLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :mood_logs do |t|
      t.integer :morning_value
      t.integer :evening_value
      t.date :date
      t.references :daily_journey, foreign_key: true
      t.references :area, foreign_key: true

      t.timestamps
    end
  end
end
