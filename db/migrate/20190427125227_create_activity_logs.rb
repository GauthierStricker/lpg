class CreateActivityLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :activity_logs do |t|
      t.boolean :done
      t.integer :spent_klr
      t.string :comment
      t.date :date
      t.references :area, foreign_key: true
      t.references :daily_journey, foreign_key: true

      t.timestamps
    end
  end
end
