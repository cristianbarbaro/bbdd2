class CreateCrops < ActiveRecord::Migration[5.2]
  def change
    create_table :crops do |t|
      t.text :comment
      t.float :amount
      t.references :variety, foreign_key: true
      t.references :plot, foreign_key: true

      t.timestamps
    end
  end
end
