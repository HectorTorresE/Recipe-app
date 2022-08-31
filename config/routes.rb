Rails.application.routes.draw do
  devise_for :users
  
  root 'foods#index'
  resources :public_recipes
  resources :foods, only[:index, :new, :create, :destroy]
  resources :recipes
  resources :shopping_list, only[:index]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
