class AddAvatarToHeros < ActiveRecord::Migration[5.2]
  def change
    add_column :heros, :avatar, :string
  end
end
