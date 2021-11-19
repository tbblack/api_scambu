class Troca < ApplicationRecord
    validates :solicitado_id, presence: true
    validates :solicitante_id, presence: true
    validates :produto_id, presence: true
    
    belongs_to :solicitado, class_name: "User"
    belongs_to :solicitante, class_name: "User"
    belongs_to :produto
end
