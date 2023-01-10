Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users
  get 'homes/about', as: "about"
  resource :users, only: [:index, :show, :edit]
  resource :books , only: [:index, :show, :edit]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
