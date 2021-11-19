class User < ApplicationRecord
    validates :name, presence: true
    validates :cpf, presence: true

    has_many :produto
end
