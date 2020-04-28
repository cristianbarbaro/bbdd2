class AddLockVersionToProblems < ActiveRecord::Migration[5.2]
  def change
    add_column :problems, :lock_version, :integer
  end
end
