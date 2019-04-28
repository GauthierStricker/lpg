class AddProofToActivityLogs < ActiveRecord::Migration[5.2]
  def change
    add_column :activity_logs, :proof, :string
  end
end
