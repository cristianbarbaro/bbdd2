class Farm < ApplicationRecord
    has_many :plots, :dependent => :restrict_with_error
    validates :name, :description, presence: true
    validates :name, format: { with: /\A[a-zA-Z0-9 ]+\z/ }
end
