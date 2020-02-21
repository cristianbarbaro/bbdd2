class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :product_applications, :ammount, :amount
  end
end
