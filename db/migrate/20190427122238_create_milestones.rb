class CreateMilestones < ActiveRecord::Migration[5.2]
  def change
    create_table :milestones do |t|
      t.string :name
      t.boolean :acheived
      t.boolean :active
      t.date :deadline
      t.integer :position
      t.float :xp_value
      t.references :quest, foreign_key: true

      t.timestamps
    end
  end
end
