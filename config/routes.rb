Rails.application.routes.draw do
  devise_for :users

  root 'foods#index'
  resources :public_recipes
  resources :foods, only: [:index, :new, :create, :destroy]
  resources :recipes, only: [:index, :show, :new, :create, :destroy] do
    get "/foods/:id/remove" => "recipes#remove_food", as: :remove_food
    get "/foods/add" => "recipes#add_food_view", as: :add_food_view
    post "/foods/add" => "recipes#add_food", as: :add_food
  end
  resources :shopping_list, only: [:index]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
