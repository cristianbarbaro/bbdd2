class Farm < ApplicationRecord
    has_many :plots, :dependent => :destroy
    has_and_belongs_to_many :users
    validates :name, :description, presence: true
    validates :name, format: { with: /\A[a-zA-Z0-9 ]+\z/ }
end
