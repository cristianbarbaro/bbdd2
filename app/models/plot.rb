class Plot < ApplicationRecord
  belongs_to :farm
  has_many :plantations
  has_many :crops

  validates :identifier, :surface, :farm_id, presence: true
  validates :greenhouse, inclusion: [true, false]
  validates :surface, numericality: {greater_than_or_equal_to: 0}
  validates :identifier, format: { with: /\A[a-zA-Z0-9 ]+\z/ }
end
