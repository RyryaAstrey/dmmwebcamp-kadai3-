Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users
  get 'homes/about', as: "about"
  resources :users, only: [:index, :show, :edit]
  resources :books, only: [:index, :show, :edit, :create]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
