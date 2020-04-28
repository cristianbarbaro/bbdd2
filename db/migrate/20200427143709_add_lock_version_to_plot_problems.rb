class AddLockVersionToPlotProblems < ActiveRecord::Migration[5.2]
  def change
    add_column :plot_problems, :lock_version, :integer
  end
end
