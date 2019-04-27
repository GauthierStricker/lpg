class AddHeroToTasks < ActiveRecord::Migration[5.2]
  def change
    add_reference :tasks, :hero, foreign_key: true
  end
end
