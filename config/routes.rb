Rails.application.routes.draw do
  resources :createddates
  
  # get 'welcome/index', to :'welcome#index'
  # get 'stats/index', to :'stats#index'
  devise_for :users
  root 'welcome#index'
  resources :stats
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  
  # root 'stats#index'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
