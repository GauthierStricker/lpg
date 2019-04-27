class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name
      t.boolean :done
      t.date :date
      t.references :daily_journey, foreign_key: true

      t.timestamps
    end
  end
end
