
module Api
	module V1
		class UsersController < ApplicationController   
			# Listar todos os usuarios
            def index
				users = User.order('created_at DESC');
				render json: {status: 'SUCCESS', message:'Usuarios carregados', data:users},status: :ok
			end

			# Listar usuario passando ID
			def show
				user = User.find(params[:id])
				render json: {status: 'SUCCESS', message:'usuario carregado', data:user},status: :ok
			end

			# Criar um novo usuario
			def create
				user = User.new(user_params)
				if user.save
					render json: {status: 'SUCCESS', message:'usuario salvo', data:user},status: :ok
				else
					render json: {status: 'ERROR', message:'usuario não salvo', data:user.erros},status: :unprocessable_entity
				end
			end

			# Excluir usuario
			def destroy
				user = User.find(params[:id])
				user.destroy
				render json: {status: 'SUCCESS', message:'usuario deletado', data:user},status: :ok
			end

			# Atualizar um usuario
			def update
				user = User.find(params[:id])
				if user.update(user_params)
					render json: {status: 'SUCCESS', message:'usuario atualizado', data:user},status: :ok
				else
					render json: {status: 'ERROR', message:'usuario não atualizado', data:user.erros},status: :unprocessable_entity
				end
			end

			# Listar produtos do usuario passando ID
			def show_produtos
				user = User.find(params[:id])
				produtos = user.produto
				render json: {status: 'SUCCESS', message:'produtos do usuario carregado', data:produtos},status: :ok
			end


			# Parametros aceitos
			private

			def user_params
				params.permit(:name, :cpf)
			end

		end
	end
end