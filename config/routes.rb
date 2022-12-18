Rails.application.routes.draw do
  
  devise_for :users
  resources :families, only: [:index, :show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
  resources :users,only:[:index, :update, :edit, :destroy, :new] do
    resources :schedules
  end
end