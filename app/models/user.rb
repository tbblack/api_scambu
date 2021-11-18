class User < ApplicationRecord
    validates :name, presence: true
    validates :cpf, presence: true

    has_many :produto

    def cadastra_produto(name, descricao, quantidade)
        produto = Produto.new(name: name, descricao: descricao, quantidade: quantidade, user_id: self.id)
        if produto.save
            render json: {status: 'SUCCESS', message:'produto salvo', data:produto},status: :ok
        else
            render json: {status: 'ERROR', message:'produto não salvo', data:produto.erros},status: :unprocessable_entity
        end
    end
end
