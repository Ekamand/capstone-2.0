Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :users

  	get "/index" => "posts#index"
  	
  	get "/users/:id" => "users#show"
	post "/users" => "users#create"
	get "/users/:id/edit" => "users#edit"
	patch "/users/:id" => "users#update"
	get "/users/:id/followings" => "followings#index"
	
  	post "/search" => "posts#search"
    get "/search" => "posts#search"
    

	patch "/posts/:id" => "posts#update"
	delete "/posts/:id" => "posts#destroy"
	get  "/posts/:id/edit" => "posts#edit" 
	get "/posts/new" => "posts#new"
	post "/posts" => "posts#create"
	get "/posts/:id" => "posts#show"
	# get "/users/:id/posts" => ""
	get "/feed" => "posts#feed"
	get "/signup" => "users#new"

	

	get "/login" => "sessions#new"
	post "/login" => "sessions#create"

	get "/logout" => "sessions#destroy"

	post "/comments" => "comments#create"

	  get "/favorites" => "favorites#index"
  post "/favorites" => "favorites#create"
  delete "/favorites/:id" => "favorites#destroy"
end
