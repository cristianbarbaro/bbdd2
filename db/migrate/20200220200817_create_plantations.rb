class CreatePlantations < ActiveRecord::Migration[5.2]
  def change
    create_table :plantations do |t|
      t.text :comment
      t.integer :amount, null: false
      t.references :species, foreign_key: true
      t.references :plot, foreign_key: true

      t.timestamps
    end
  end
end
