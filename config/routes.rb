Rails.application.routes.draw do
  get 'users/show'
  get 'users/exit'
  get 'books/new'
  get 'books/index'
  get 'books/show'
  root to:"homes#top"
  get "homes/about", as:'about'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
