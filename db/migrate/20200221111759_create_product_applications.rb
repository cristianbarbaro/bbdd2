class CreateProductApplications < ActiveRecord::Migration[5.2]
  def change
    create_table :product_applications do |t|
      t.float :amount, null: false
      t.text :comment
      t.references :product, foreign_key: true
      t.references :plot, foreign_key: true

      t.timestamps
    end
  end
end
