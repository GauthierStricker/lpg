class AddHeroToAreas < ActiveRecord::Migration[5.2]
  def change
    add_reference :areas, :hero, foreign_key: true
  end
end
