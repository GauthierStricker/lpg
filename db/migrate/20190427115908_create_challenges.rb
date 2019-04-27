class CreateChallenges < ActiveRecord::Migration[5.2]
  def change
    create_table :challenges do |t|
      t.string :name
      t.float :xp_value
      t.references :hero, foreign_key: true
      t.references :area, foreign_key: true

      t.timestamps
    end
  end
end
