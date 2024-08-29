Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  get 'users', to: 'users#index', as: 'all_users'
  get 'books', to: 'books#index', as: 'all_books'
  get "about", to: "homes#about", as:"about"
  resources :users, only: [:index, :show, :edit, :update]
  resources :books, only: [:index, :show, :create, :edit, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
