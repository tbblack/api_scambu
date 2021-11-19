class Produto < ApplicationRecord
    validates :name, presence: true

    belongs_to :user
    has_many :troca
end
