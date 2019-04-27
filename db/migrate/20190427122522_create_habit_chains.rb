class CreateHabitChains < ActiveRecord::Migration[5.2]
  def change
    create_table :habit_chains do |t|
      t.date :start_date
      t.date :end_date
      t.integer :duration
      t.references :habit, foreign_key: true

      t.timestamps
    end
  end
end
