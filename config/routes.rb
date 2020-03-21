Rails.application.routes.draw do
  get 'posts/index'
  get 'posts/show'
  get 'contacts/new', to: "contacts#new"
  post 'contacts/new', to: "contacts#create"
  root 'static_pages#home'
  get "/help", to: "static_pages#help"
  get "/contact", to: "static_pages#contact"
  get "/about", to: "static_pages#about"
  get "/signup", to: "users#new"
  get "/input", to: "static_pages#input"
  post "/signup", to: "users#create"
  get "/login", to:'sessions#new'
  post "/login", to:"sessions#create"
  delete "/logout", to:"sessions#destroy"
  # get "/conditions/filter", to: "conditions#filter"
  
  resources :users
  resources :conditions
  resources :account_activations,only:[:edit]
  resources :posts, only: [:index, :show, :create] do
    resources :comments, only: [:create]
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
