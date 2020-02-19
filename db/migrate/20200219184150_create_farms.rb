class CreateFarms < ActiveRecord::Migration[5.2]
  def change
    create_table :farms do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.string :address

      t.timestamps
    end
  end
end
