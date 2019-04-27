class CreateWeightLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :weight_logs do |t|
      t.float :value
      t.string :comment
      t.date :date
      t.references :area, foreign_key: true
      t.references :daily_journey, foreign_key: true

      t.timestamps
    end
  end
end
