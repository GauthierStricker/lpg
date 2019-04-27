class CreateQuests < ActiveRecord::Migration[5.2]
  def change
    create_table :quests do |t|
      t.string :name
      t.boolean :acheived
      t.boolean :active
      t.string :description
      t.date :deadline
      t.float :total_xp
      t.float :won_xp
      t.references :hero, foreign_key: true
      t.references :area, foreign_key: true

      t.timestamps
    end
  end
end
