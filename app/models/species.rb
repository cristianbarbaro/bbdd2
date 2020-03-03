class Species < ApplicationRecord
    has_many :plantations, dependent: :restrict_with_error

    validates :name, presence: true
    validates :name, format: { with: /\A[a-zA-Z ]+\z/ }
end
