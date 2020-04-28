class AddLockVersionToCrops < ActiveRecord::Migration[5.2]
  def change
    add_column :crops, :lock_version, :integer
  end
end
