Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :users

  	get "/index" => "posts#index"
  	
	patch "/posts/:id" => "posts#update"
	delete "/posts/:id" => "posts#destroy"
	get  "/posts/:id/edit" => "posts#edit" 
	get "/posts/new" => "posts#new"
	post "/posts" => "posts#create"
	get "/posts/:id" => "posts#show"

	get "/signup" => "users#new"

	get "/users/:id" => "users#show"
	post "/users" => "users#create"
	get "/users/:id/edit" => "users#edit"
	patch "/users/:id" => "users#update"

	get "/login" => "sessions#new"
	post "/login" => "sessions#create"

	get "/logout" => "sessions#destroy"

	post "/comments" => "comments#create"
end
