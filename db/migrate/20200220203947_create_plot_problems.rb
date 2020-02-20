class CreatePlotProblems < ActiveRecord::Migration[5.2]
  def change
    create_table :plot_problems do |t|
      t.text :comment
      t.references :problem, foreign_key: true
      t.references :plot, foreign_key: true

      t.timestamps
    end
  end
end
