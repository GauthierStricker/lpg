class CreateMeditationLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :meditation_logs do |t|
      t.boolean :done
      t.integer :duration
      t.date :date
      t.references :daily_journey, foreign_key: true
      t.references :area, foreign_key: true

      t.timestamps
    end
  end
end
