class AddLockVersionToFarms < ActiveRecord::Migration[5.2]
  def change
    add_column :farms, :lock_version, :integer
  end
end
