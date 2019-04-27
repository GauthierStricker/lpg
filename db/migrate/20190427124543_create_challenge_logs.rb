class CreateChallengeLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :challenge_logs do |t|
      t.boolean :done
      t.float :won_xp
      t.date :date
      t.references :challenge, foreign_key: true
      t.references :daily_journey, foreign_key: true

      t.timestamps
    end
  end
end
