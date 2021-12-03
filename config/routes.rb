Rails.application.routes.draw do
  namespace 'api' do
  	namespace 'v1' do
		# teste login
		post "/users/login", to: "users#login"
  		get "/users/auto_login", to: "users#auto_login"
  		#resources :users
		
		#CRUD base Usuario
		get '/users/index', to: 'users#index'
		get '/users/show/:id', to: 'users#show'
		post '/users/create', to: 'users#create'
		delete '/users/delete/:id', to: 'users#destroy'
		patch '/users/update/:id', to: 'users#update'
		put '/users/update/:id', to: 'users#update'

		#Metodos fora do CRUD USUARIO
		get '/users/show_produtos/:id', to: 'users#show_produtos'
		post '/users/busca_pelo_nome', to: 'users#busca_pelo_nome'
		post '/users/busca_pelo_cpf', to: 'users#busca_pelo_cpf'
		
		#CRUD base Produtos
		get '/produtos/index', to: 'produtos#index'
		get '/produtos/show/:id', to: 'produtos#show'
		post '/produtos/create', to: 'produtos#create'
		delete '/produtos/delete/:id', to: 'produtos#destroy'
		patch '/produtos/update/:id', to: 'produtos#update'
		put '/produtos/update/:id', to: 'produtos#update'

		#Metodos fora do CRUD PRODUTO
		get '/produtos/show_usuario/:id', to: 'produtos#show_usuario'
		post '/produtos/busca_pelo_nome', to: 'produtos#busca_pelo_nome'

		#CRUD base Trocas
		get '/trocas/index', to: 'trocas#index'
		get '/trocas/show/:id', to: 'trocas#show'
		post '/trocas/create', to: 'trocas#create'
		delete '/trocas/delete/:id', to: 'trocas#destroy'
		patch '/trocas/update/:id', to: 'trocas#update'
		put '/trocas/update/:id', to: 'trocas#update'

		#Metodos fora do CRUD trocas
		get '/trocas/busca_usuarios_troca/:id', to: 'trocas#busca_usuarios_troca'

  	end
  end
end
