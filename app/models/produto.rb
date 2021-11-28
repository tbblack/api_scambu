# == Schema Information
#
# Table name: produtos
#
#  id         :bigint           not null, primary key
#  name       :string
#  descricao  :string
#  quantidade :integer
#  user_id    :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Produto < ApplicationRecord
    validates :name, presence: true

    belongs_to :user
    has_many :troca
end
