class Species < ApplicationRecord
    validates :name, presence: true
    validates :name, format: { with: /\A[a-zA-Z ]+\z/ }
end
