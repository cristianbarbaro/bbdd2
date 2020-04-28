class AddLockVersionToProductApplications < ActiveRecord::Migration[5.2]
  def change
    add_column :product_applications, :lock_version, :integer
  end
end
