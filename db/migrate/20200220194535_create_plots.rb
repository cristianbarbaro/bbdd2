class CreatePlots < ActiveRecord::Migration[5.2]
  def change
    create_table :plots do |t|
      t.string :identifier, null: false
      t.float :surface, null: false
      t.boolean :greenhouse, null: false
      t.text :description
      t.references :farm, foreign_key: true

      t.timestamps
    end
  end
end
