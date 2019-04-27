class CreateHabits < ActiveRecord::Migration[5.2]
  def change
    create_table :habits do |t|
      t.string :name
      t.boolean :active
      t.boolean :acheived
      t.references :hero, foreign_key: true
      t.references :area, foreign_key: true

      t.timestamps
    end
  end
end
