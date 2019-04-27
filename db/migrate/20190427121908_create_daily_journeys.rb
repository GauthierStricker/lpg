class CreateDailyJourneys < ActiveRecord::Migration[5.2]
  def change
    create_table :daily_journeys do |t|
      t.date :date
      t.float :notation
      t.float :won_xp
      t.boolean :locked
      t.references :hero, foreign_key: true

      t.timestamps
    end
  end
end
