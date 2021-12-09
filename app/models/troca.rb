# == Schema Information
#
# Table name: trocas
#
#  id                 :bigint           not null, primary key
#  solicitante_id     :integer
#  solicitado_id      :integer
#  produto_id         :bigint
#  aceite_solicitante :boolean          default(FALSE)
#  aceite_solicitado  :boolean          default(FALSE)
#  troca_finalizada   :boolean          default(FALSE)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
class Troca < ApplicationRecord
    validates :solicitado_id, presence: true
    validates :solicitante_id, presence: true
    validates :produto_id, presence: true
    
    belongs_to :solicitado, class_name: "User"
    belongs_to :solicitante, class_name: "User"
    belongs_to :produto
end
