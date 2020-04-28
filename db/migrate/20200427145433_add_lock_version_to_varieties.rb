class AddLockVersionToVarieties < ActiveRecord::Migration[5.2]
  def change
    add_column :varieties, :lock_version, :integer
  end
end
