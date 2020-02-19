class Variety < ApplicationRecord
    validates :name, :scientific_name, presence: true
    validates :name, :scientific_name, format: { with: /\A[a-zA-Z ]+\z/ }
end
