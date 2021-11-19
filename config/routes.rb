Rails.application.routes.draw do
  namespace 'api' do
  	namespace 'v1' do
  		#resources :users
		
		#CRUD base Usuario
		get '/users/index', to: 'users#index'
		post '/users/create', to: 'users#create'
		get '/users/show/:id', to: 'users#show'
		patch '/users/update/:id', to: 'users#update'
		put '/users/update/:id', to: 'users#update'
		delete '/users/delete/:id', to: 'users#destroy'

		#Metodos fora do CRUD USUARIO
		get '/users/show_produtos/:id', to: 'users#show_produtos'

		#CRUD base Produtos
		get '/produtos/index', to: 'produtos#index'
		post '/produtos/create', to: 'produtos#create'
		get '/produtos/show/:id', to: 'produtos#show'
		patch '/produtos/update/:id', to: 'produtos#update'
		put '/produtos/update/:id', to: 'produtos#update'
		delete '/produtos/delete/:id', to: 'produtos#destroy'
		
  	end
  end
end
