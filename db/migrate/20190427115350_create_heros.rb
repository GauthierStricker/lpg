class CreateHeros < ActiveRecord::Migration[5.2]
  def change
    create_table :heros do |t|
      t.string :name
      t.float :total_xp
      t.float :weight
      t.float :total_money
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
