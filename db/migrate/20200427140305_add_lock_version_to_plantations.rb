class AddLockVersionToPlantations < ActiveRecord::Migration[5.2]
  def change
    add_column :plantations, :lock_version, :integer
  end
end
