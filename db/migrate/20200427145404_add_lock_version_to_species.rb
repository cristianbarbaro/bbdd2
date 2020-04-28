class AddLockVersionToSpecies < ActiveRecord::Migration[5.2]
  def change
    add_column :species, :lock_version, :integer
  end
end
