
module Api
	module V1
		class ProdutosController < ApplicationController   
			# Listar todos os Produtos
            # get '/produtos/index', to: 'produtos#index'
            def index
				produtos = Produto.order('created_at DESC');
				render json: {status: 'SUCCESS', message:'Produtos carregados', data:produtos},status: :ok
			end

			# Listar produtos passando ID
            # get '/produtos/show/:id', to: 'produtos#show'
			def show
				produto = Produto.find(params[:id])
				render json: {status: 'SUCCESS', message:'produto carregado', data:produto},status: :ok
			end

			# Criar um novo produto
            # post '/produtos/create', to: 'produtos#create'
			def create
				produto = Produto.new(produto_params)
				if produto.save
					render json: {status: 'SUCCESS', message:'produto salvo', data:produto},status: :ok
				else
					render json: {status: 'ERROR', message:'produto não salvo', data:produto.erros},status: :unprocessable_entity
				end
			end

			# Excluir produto
            # delete '/produtos/delete/:id', to: 'produtos#destroy'
			def destroy
				produto = Produto.find(params[:id])
				produto.destroy
				render json: {status: 'SUCCESS', message:'produto deletado', data:produto},status: :ok
			end

			# Atualizar um produto
            # patch '/produtos/update/:id', to: 'produtos#update'
		    # put '/produtos/update/:id', to: 'produtos#update'
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
				params.permit(:name, :descricao, :quantidade, :user_id)
			end

		end
	end
end