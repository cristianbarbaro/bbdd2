class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.text :composition
      t.text :description, null: true

      t.timestamps
    end
  end
end
