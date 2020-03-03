class Plot < ApplicationRecord
  belongs_to :farm
  has_many :plantations, dependent: :destroy
  has_many :plot_problems, dependent: :destroy
  has_many :crops, dependent: :destroy
  has_many :product_applications, dependent: :destroy

  validates :identifier, :surface, :farm_id, presence: true
  validates :greenhouse, inclusion: [true, false]
  validates :surface, numericality: {greater_than_or_equal_to: 0}
  validates :identifier, format: { with: /\A[a-zA-Z0-9 ]+\z/ }
end
