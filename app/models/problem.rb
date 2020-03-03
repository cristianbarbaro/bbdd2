class Problem < ApplicationRecord
    has_many :plot_problems, dependent: :restrict_with_error

    validates :name, :scientific_name, presence: true
    validates :name, :scientific_name, format: { with: /\A[a-zA-Z ]+\z/ }
end
