
module Api
	module V1
		class UsersController < ApplicationController   
			before_action :authorized, except: [:auto_login, :login, :create]
			# Listar todos os usuarios
			# get '/users/index', to: 'users#index'
            def index
				users = User.order('created_at DESC');
				render json: {status: 'SUCCESS', message:'Usuarios carregados', data:users},status: :ok
			end

			# Listar usuario passando ID
			# get '/users/show/:id', to: 'users#show'
			def show
				user = User.find(params[:id])
				render json: {status: 'SUCCESS', message:'usuario carregado', data:user},status: :ok
			end

			# Excluir usuario
			# delete '/users/delete/:id', to: 'users#destroy'
			def destroy
				user = User.find(params[:id])
				user.destroy
				render json: {status: 'SUCCESS', message:'usuario deletado', data:user},status: :ok
			end

			# Atualizar um usuario
			# patch '/users/update/:id', to: 'users#update'
			# put '/users/update/:id', to: 'users#update'
			def update
				user = User.find(params[:id])
				if user.update(user_params)
					render json: {status: 'SUCCESS', message:'usuario atualizado', data:user},status: :ok
				else
					render json: {status: 'ERROR', message:'usuario não atualizado', data:user.erros},status: :unprocessable_entity
				end
			end

			# Listar produtos do usuario passando ID
			# get '/users/show_produtos/:id', to: 'users#show_produtos'
			def show_produtos
				user = User.find(params[:id])
				produtos = user.produto
				render json: {status: 'SUCCESS', message:'produtos do usuario carregado', data:produtos},status: :ok
			end

			# Buscar Usuario ou Usuarios com base no nome
			# post '/users/busca_pelo_nome', to: 'users#busca_pelo_nome'
			def busca_pelo_nome
				users = User.where('name LIKE ?', "%#{user_params[:name]}%")
				render json: {status: 'SUCCESS', message:'Usuarios carregados', data:users},status: :ok
			end

			# Buscar Usuario ou Usuarios com base no nome
			# post '/users/busca_pelo_cpf', to: 'users#busca_pelo_nome'
			def busca_pelo_cpf
				users = User.where('cpf LIKE ?', "%#{user_params[:cpf]}%")
				render json: {status: 'SUCCESS', message:'Usuarios carregados', data:users},status: :ok
			end

			# Busca de trocas não finalizadas
			def trocas_nao_finalizadas
				user = User.find(params[:id])
				trocas = User.solicitado_trocas.where('troca_finalizada LIKE ?', '0')
				trocas += User.solicitante_trocas
				render json: {status: 'SUCCESS', message:'trocas nao finalizadas', data:trocas},status: :ok
			end

			# REGISTER
			def create
				@user = User.create(user_params)
				if @user.valid?
				token = encode_token({user_id: @user.id})
				render json: {status: 'SUCCESS', message:'trocas nao finalizadas', user: @user, token: token},status: :ok
				else
				render json: {error: "Invalid username or password"}
				end
			end

			# LOGGING IN
			def login
				@user = User.find_by(username: params[:username])

				if @user && @user.authenticate(params[:password])
				token = encode_token({user_id: @user.id})
				render json: {user: @user, token: token}
				else
				render json: {error: "Invalid username or password"}
				end
			end


			def auto_login
				render json: @user
			end


			# Parametros aceitos
			private

			def user_params
				params.permit(:name, :cpf, :username, :password)
			end

		end
	end
end