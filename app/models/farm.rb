class Farm < ApplicationRecord
    validates :name, :description, presence: true
    validates :name, format: { with: /\A[a-zA-Z0-9 ]+\z/ }
end
