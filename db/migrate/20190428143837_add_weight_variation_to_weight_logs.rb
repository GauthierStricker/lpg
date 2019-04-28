class AddWeightVariationToWeightLogs < ActiveRecord::Migration[5.2]
  def change
    add_column :weight_logs, :weight_variation, :float
  end
end
