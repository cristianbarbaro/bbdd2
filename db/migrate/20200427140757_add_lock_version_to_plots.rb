class AddLockVersionToPlots < ActiveRecord::Migration[5.2]
  def change
    add_column :plots, :lock_version, :integer
  end
end
