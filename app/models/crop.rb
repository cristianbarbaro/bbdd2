class Crop < ApplicationRecord
  belongs_to :variety
  belongs_to :plot
end
