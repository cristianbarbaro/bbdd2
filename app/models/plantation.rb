class Plantation < ApplicationRecord
  belongs_to :species
  belongs_to :plot

  validates :amount, :plot_id, presence: true
  validates :amount, numericality: {greater_than_or_equal_to: 0}
end
