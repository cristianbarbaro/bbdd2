class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.text :composition, null: false
      t.text :description, null: true

      t.timestamps
    end
  end
end
