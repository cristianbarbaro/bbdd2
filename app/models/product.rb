class Product < ApplicationRecord
    validates :name, :composition, presence: true
    validates :name, format: { with: /\A[a-zA-Z ]+\z/ }
end
