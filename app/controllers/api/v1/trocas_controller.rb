
module Api
	module V1
		class TrocasController < ApplicationController   
			# Listar todos os Troca
            # get '/trocas/index', to: 'trocas#index'
            def index
				trocas = Troca.order('created_at DESC');
				render json: {status: 'SUCCESS', message:'Troca carregados', data:trocas},status: :ok
			end

			# Listar trocas passando ID
            # get '/trocas/show/:id', to: 'trocas#show'
			def show
				troca = Troca.find(params[:id])
				render json: {status: 'SUCCESS', message:'troca carregado', data:troca},status: :ok
			end

			# Criar um novo troca
            # post '/trocas/create', to: 'trocas#create'
			def create
                #binding.pry
                produto = Produto.find_by(id: params["produto_id"])
				troca = Troca.new(solicitante_id: params["solicitante_id"], solicitado_id: produto.user.id, produto_id: params["produto_id"])
				if troca.save
					render json: {status: 'SUCCESS', message:'troca salvo', data:troca},status: :ok
				else
					render json: {status: 'ERROR', message:'troca não salvo', data:troca.erros},status: :unprocessable_entity
				end
			end

			# Excluir troca
            # delete '/trocas/delete/:id', to: 'trocas#destroy'
			def destroy
				troca = Troca.find(params[:id])
				troca.destroy
				render json: {status: 'SUCCESS', message:'troca deletado', data:troca},status: :ok
			end

			# Atualizar um troca
            # patch '/trocas/update/:id', to: 'trocas#update'
		    # put '/trocas/update/:id', to: 'trocas#update'
			def update
				troca = Troca.find(params[:id])
				if troca.update(troca_params)
					render json: {status: 'SUCCESS', message:'troca atualizado', data:troca},status: :ok
				else
					render json: {status: 'ERROR', message:'troca não atualizado', data:troca.erros},status: :unprocessable_entity
				end
			end

            # busca os usuarios da troca
            # get '/trocas/busca_usuarios_troca/:id', to: 'trocas#busca_usuarios_troca'
            def busca_usuarios_troca
                troca = Troca.find(params[:id])
                usuarios = [troca.solicitante, troca.solicitado]
                render json: {status: 'SUCCESS', message:'usuarios da troca carregados', data:usuarios},status: :ok
            end

			# Parametros aceitos
			private

			def troca_params
				params.permit(:solicitante_id, :produto_id)
			end

		end
	end
end