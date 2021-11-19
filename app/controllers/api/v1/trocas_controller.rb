
module Api
	module V1
		class TrocasController < ApplicationController   
			# Listar todos os Troca
            def index
				trocas = Troca.order('created_at DESC');
				render json: {status: 'SUCCESS', message:'Troca carregados', data:trocas},status: :ok
			end

			# Listar trocas passando ID
			def show
				troca = Troca.find(params[:id])
				render json: {status: 'SUCCESS', message:'troca carregado', data:troca},status: :ok
			end

			# Criar um novo troca
			def create
				troca = Troca.new(troca_params)
				if troca.save
					render json: {status: 'SUCCESS', message:'troca salvo', data:troca},status: :ok
				else
					render json: {status: 'ERROR', message:'troca não salvo', data:troca.erros},status: :unprocessable_entity
				end
			end

			# Excluir troca
			def destroy
				troca = Troca.find(params[:id])
				troca.destroy
				render json: {status: 'SUCCESS', message:'troca deletado', data:troca},status: :ok
			end

			# Atualizar um troca
			def update
				troca = Troca.find(params[:id])
				if troca.update(troca_params)
					render json: {status: 'SUCCESS', message:'troca atualizado', data:troca},status: :ok
				else
					render json: {status: 'ERROR', message:'troca não atualizado', data:troca.erros},status: :unprocessable_entity
				end
			end

            # busca os usuarios da troca
            def busca_usuarios_troca
                troca = Troca.find(params[:id])
                usuarios = [troca.solicitante, troca.solicitado]
                render json: {status: 'SUCCESS', message:'usuarios da troca carregados', data:usuarios},status: :ok
            end

			# Parametros aceitos
			private

			def troca_params
				params.permit(:solicitante_id, :solicitado_id, :produto_id)
			end

		end
	end
end