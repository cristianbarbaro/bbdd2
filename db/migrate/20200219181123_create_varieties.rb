class CreateVarieties < ActiveRecord::Migration[5.2]
  def change
    create_table :varieties do |t|
      t.string :name, null: false
      t.string :scientific_name, null: false
      t.string :url, null: true
      t.text :description, null: true

      t.timestamps
    end
  end
end
