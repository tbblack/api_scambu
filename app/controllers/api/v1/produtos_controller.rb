
module Api
	module V1
		class ProdutosController < ApplicationController   
			# Listar todos os Produtos
            def index
				produtos = Produto.order('created_at DESC');
				render json: {status: 'SUCCESS', message:'Produtos carregados', data:produtos},status: :ok
			end

			# Listar produtos passando ID
			def show
				produto = Produto.find(params[:id])
				render json: {status: 'SUCCESS', message:'produto carregado', data:produto},status: :ok
			end

			# Criar um novo produto
			def create
				produto = Produto.new(produto_params)
				if produto.save
					render json: {status: 'SUCCESS', message:'produto salvo', data:produto},status: :ok
				else
					render json: {status: 'ERROR', message:'produto não salvo', data:produto.erros},status: :unprocessable_entity
				end
			end

			# Excluir produto
			def destroy
				produto = Produto.find(params[:id])
				produto.destroy
				render json: {status: 'SUCCESS', message:'produto deletado', data:produto},status: :ok
			end

			# Atualizar um produto
			def update
				produto = Produto.find(params[:id])
				if produto.update(produto_params)
					render json: {status: 'SUCCESS', message:'produto atualizado', data:produto},status: :ok
				else
					render json: {status: 'ERROR', message:'produto não atualizado', data:produto.erros},status: :unprocessable_entity
				end
			end

			# Parametros aceitos
			private

			def produto_params
				params.permit(:name, :descicao, :quantidade)
			end

		end
	end
end