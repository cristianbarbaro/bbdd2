class PlotProblem < ApplicationRecord
  belongs_to :problem
  belongs_to :plot

  validates :plot_id, :problem_id, presence: true
end
