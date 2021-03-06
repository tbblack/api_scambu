# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  name            :string
#  cpf             :string
#  username        :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
    has_secure_password
    validates :name, presence: true
    validates :cpf, presence: true

    has_many :produto


    has_many :solicitante_trocas, foreign_key: :solicitante_id, class_name: "Troca"
    has_many :solicitantes, through: :solicitante_trocas

    has_many :solicitado_trocas, foreign_key: :solicitado_id, class_name: "Troca"
    has_many :solicitados, through: :solicitado_trocas    
end
