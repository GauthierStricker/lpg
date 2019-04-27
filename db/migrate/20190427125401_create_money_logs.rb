class CreateMoneyLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :money_logs do |t|
      t.float :gained_money
      t.float :spend_money
      t.float :balanced_money
      t.string :comment
      t.date :date
      t.references :area, foreign_key: true
      t.references :daily_journey, foreign_key: true

      t.timestamps
    end
  end
end
